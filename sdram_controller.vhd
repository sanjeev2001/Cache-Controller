library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity sdram_controller is
  port
  (
    clk      : in std_logic;
    addr     : in std_logic_vector(15 downto 0);
    wr_rd      : in std_logic;
    mstrb  : in std_logic;
    din  : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0)
  );
end sdram_controller;

architecture Behavioural of sdram_controller is
  type memory_type is array (7 downto 0, 31 downto 0) of std_logic_vector(7 downto 0);
  signal memory      : memory_type;
  signal index       : integer := to_integer(unsigned(addr(7 downto 5)));
  signal offset      : integer := to_integer(unsigned(addr(4 downto 0)));
  signal initialized : integer := 0;

begin
  process (clk)
  begin
    if (clk'event and clk = '1') then
		if (initialized = 0) then
        for i in 0 to 7 loop
			 for j in 0 to 31 loop
		      memory(i, j) <= "00000000";
			end loop;
		  end loop;
        initialized <= 1;
      end if;

      if (mstrb = '1') then
        if (wr_rd = '1') then
          memory(index, offset) <= din;
        else
          dout <= memory(index, offset);
        end if;
      end if;
    end if;
  end process;
end Behavioural;