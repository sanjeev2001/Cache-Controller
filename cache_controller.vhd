library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity cacheController is
  port
  (
    clk  : in std_logic;
    rst  : in std_logic;
    trig : in std_logic;
    ------------------------------------------------
    boundary_cpu_address : out std_logic_vector(15 downto 0);
    --cpu issues a 16 bit address
    --each address contains:
    -- tag: 15 downto 8
    -- index: 7 downto 5
    -- offset: 4 downto 0
    boundary_cpu_din  : out std_logic_vector(7 downto 0);
    boundary_cpu_dout : out std_logic_vector(7 downto 0);
    boundary_cpu_w_r  : out std_logic;
    boundary_cpu_cs   : out std_logic;
    boundary_cpu_rdy  : out std_logic;
    boundary_mstrb    : out std_logic;
    globalState       : out std_logic_vector(2 downto 0);
    globalTag         : out std_logic_vector(7 downto 0);
    globalIndex       : out std_logic_vector(2 downto 0);
    globalOffset       : out std_logic_vector(4 downto 0);
    globalVbit        : out std_logic;
    globalDbit        : out std_logic

  );
end cacheController;

-- we can use a state machine to model the behavioural cases of the cache controller
-- state 0: initial state of cache controller
-- check to see if cpu_cs is 1. if it is then all signals are stable.
-- check to see if cache is a hit using tag, index, and block offset
-- if cache is a hit then set next state to 1 otherwise set to 2.
-- otherwise reset to state 0. continues until cpu_cs is 1.
-- 
-- state 1: operation state
-- check cpu_w_r signal. if 0 then read. if 1 then write.
-- 

architecture Behavioural of cacheController is
  -- CPU signals
  signal cpu_dout, cpu_din : std_logic_vector(7 downto 0);
  signal cpu_address       : std_logic_vector(15 downto 0);
  signal cpu_w_r, cpu_cs   : std_logic;
  signal cpu_rdy           : std_logic := '1';
  signal tag               : std_logic_vector(7 downto 0);
  signal index             : std_logic_vector(2 downto 0);
  signal offset            : std_logic_vector(4 downto 0);

  -- Cache signals
  type address_table_type is array (7 downto 0, 9 downto 0) of std_logic;
  signal address_table                        : address_table_type := (others => (others => '0'));
  signal cache_din, cache_dout, cache_address : std_logic_vector(7 downto 0);
  signal cache_w_r                            : std_logic;
  signal addr_tag                             : std_logic_vector(7 downto 0);
  signal hit_miss                             : std_logic;

  -- SDRAM signals
  signal sdram_din, sdram_dout : std_logic_vector(7 downto 0);
  signal sdram_address         : std_logic_vector(15 downto 0);
  signal sdram_wr_rd           : std_logic;
  signal sdram_mstrb           : std_logic;
  signal sdram_counter         : integer := 0;
  signal wordIncrement         : integer := 0;
  -- State signals
  signal state      : std_logic_vector(2 downto 0) := "000";
  signal next_state : std_logic_vector(2 downto 0);

  component cpu_gen is
    port
    (
      clk  : in std_logic;
      rst  : in std_logic;
      trig : in std_logic;
      ------------------------------------------------
      address : out std_logic_vector(15 downto 0);
      dout    : out std_logic_vector(7 downto 0);
      wr_rd     : out std_logic;
      cs      : out std_logic
    );
  end component;

  component sram is
    port
    (
      clk  : in std_logic;
      din  : in std_logic_vector(7 downto 0);
      dout : out std_logic_vector(7 downto 0);
      addr : in std_logic_vector(7 downto 0);
      wen  : in std_logic
    );
  end component;

  component sdram_controller is
    port
    (
      clk   : in std_logic;
      din   : in std_logic_vector(7 downto 0);
      dout  : out std_logic_vector(7 downto 0);
      addr  : in std_logic_vector(15 downto 0);
      wr_rd : in std_logic;
      mstrb : in std_logic
    );
  end component;
  
  component icon
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));
  end component;
  
  component ila
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    DATA : IN STD_LOGIC_VECTOR(99 DOWNTO 0);
    TRIG0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0));
  end component;

  signal control0 : std_logic_vector(35 downto 0);
  signal ila_data : std_logic_vector(99 downto 0);
  signal trig0 : std_logic_vector(7 downto 0);

begin
  cpu : cpu_gen
  port map
  (
    clk  => clk,
    rst  => rst,
    trig => trig,
    ------------------------------------------------
    address => cpu_address,
    dout    => cpu_dout,
    wr_rd     => cpu_w_r,
    cs      => cpu_cs);

  cache_mem : sram 
  PORT map (
  clk 	  => clk,
  din      => cache_din,
  dout     => cache_dout,
  addr     => cache_address,
  wen      => cache_w_r);

  sdram_mem : sdram_controller 
  PORT map (
  clk => clk,
  din      => sdram_din,
  dout     => sdram_dout,
  addr     => sdram_address,
  wr_rd    => sdram_wr_rd,
  mstrb    => sdram_mstrb);
  
  icon_instance : icon
  port map (
    CONTROL0 => CONTROL0);
	 
  ila_instance : ila
  port map (
    CONTROL => control0,
    CLK => clk,
    DATA => ila_data,
    TRIG0 => trig0);

  process (clk, next_state)
  begin
    if (clk'EVENT and clk = '1') then
      state <= next_state;
    end if;
  end process;

  process (clk, cpu_cs)
  begin
    tag    <= cpu_address(15 downto 8);
    index  <= cpu_address(7 downto 5);
    offset <= cpu_address(4 downto 0);
	 
	
	 -- TTTTTTTTDV
    for i in 0 to 7 loop
      addr_tag(i) <= address_table(to_integer(unsigned(index)), (i+2));
    end loop;

    -- Check if tag address table matches tag coming from cpu (tag comparator)
    if (addr_tag = tag) then
      hit_miss <= '1';
    else
      hit_miss <= '0';
    end if;

    -- State Machine
    -- S0 - Initial state
    if (state = "000") then
      if (cpu_cs = '1') then
        -- if cache is a hit and valid bit is 1 then set next state to 1 otherwise set to 2.
        if (hit_miss = '1' and address_table(to_integer(unsigned(index)), 0) = '1') then
          next_state <= "001";
        else
          next_state <= "010";
        end if;
      else
        next_state <= "000";
      end if;

    elsif (state = "001") then
      -- S1 - Operation state
		cpu_rdy    					  <= '0';
      cache_address(7 downto 5) <= index;
      cache_address(4 downto 0) <= offset;
      if (cpu_w_r = '0') then
        -- Read from cache
        cache_w_r <= '0'; -- Set cache_w_r to 0
		  cpu_din <= cache_dout;
      else
        -- Write to cache
        cache_din                                     <= cpu_dout; -- Set cache_din to cpu_dout
        cache_w_r                                     <= '1'; -- Set cache_w_r to 1
        address_table(to_integer(unsigned(index)), 1) <= '1'; -- Set dirty bit in address table to 1
      end if;
      cpu_rdy    <= '1';
      next_state <= "000";
    elsif (state = "010") then
		-- if dirty bit is high then go to state 3
      if (address_table(to_integer(unsigned(index)), 1) = '1') then
        next_state <= "011";
      else
        next_state <= "100";
      end if;
    elsif (state = "011") then
      -- S3 - Write back to SDRAM
      sdram_address(15 downto 5) <= cpu_address(15 downto 5);
      cache_address(7 downto 5)  <= cpu_address(7 downto 5);
      cache_w_r                  <= '1';
      sdram_address(4 downto 0)  <= "00000";
      cache_address(4 downto 0)  <= "00000";
      sdram_wr_rd                <= '1';

      if (sdram_counter /= 64) then
        if ((sdram_counter mod 2) = 0) then
          sdram_mstrb <= '0';
        else
          sdram_mstrb <= '1';
        end if;
        cache_w_r                 <= '0';
        sdram_din                 <= cache_dout;
        sdram_address(4 downto 0) <= std_logic_vector(to_unsigned(wordIncrement, 5));
        wordIncrement             <= wordIncrement + 1;
      else
        sdram_counter <= 0;
        wordIncrement <= 0;
      end if;

      next_state <= "100";

    elsif (state = "100") then
		cpu_rdy    						<= '0';
      sdram_address(15 downto 5) <= cpu_address(15 downto 5);
      cache_address(7 downto 5)  <= cpu_address(7 downto 5);
      cache_w_r                  <= '1';
      sdram_address(4 downto 0)  <= "00000";
      cache_address(4 downto 0)  <= "00000";

      if (sdram_counter /= 64) then
        if ((sdram_counter mod 2) = 0) then
          sdram_mstrb <= '0';
        else
          sdram_mstrb               <= '1';
          sdram_wr_rd               <= '0';
          sdram_address(4 downto 0) <= std_logic_vector(to_unsigned(wordIncrement, 5));
          cache_w_r                 <= '1';
          cache_address(4 downto 0) <= std_logic_vector(to_unsigned(wordIncrement, 5));
          cache_din                 <= sdram_dout;
			 cpu_din 						<= cache_din;
          wordIncrement             <= wordIncrement + 1;
        end if;
        sdram_counter <= sdram_counter + 1;
      else
        sdram_counter <= 0;
        wordIncrement <= 0;
      end if;

      for i in 0 to 7 loop
        address_table(to_integer(unsigned(index)), i+2) <= tag(i);
      end loop;
		address_table(to_integer(unsigned(index)), 1) <= '0';
      address_table(to_integer(unsigned(index)), 0) <= '1';
      cache_w_r                                     <= '0';
      next_state                                    <= "001";
    else
      cpu_rdy    <= '1';
      next_state <= "000";
    end if;
  end process;

  boundary_cpu_din     <= cpu_din;
  boundary_cpu_dout    <= cpu_dout;
  boundary_cpu_w_r     <= cpu_w_r;
  boundary_cpu_cs      <= cpu_cs;
  boundary_cpu_rdy     <= cpu_rdy;
  boundary_cpu_address <= cpu_address;
  boundary_mstrb 		  <= sdram_mstrb;

  globalState  <= state;
  globalTag    <= tag;
  globalIndex  <= index;
  globalOffset <= offset;
  globalVbit   <= address_table(to_integer(unsigned(index)), 0);
  globalDbit   <= address_table(to_integer(unsigned(index)), 1);
  
  ila_data(15 downto 0) <= cpu_address;
  ila_data(18 downto 16) <= state;
  ila_data(19) <= cpu_w_r;
  ila_data(27 downto 20) <= cpu_dout;
  
  

end Behavioural;