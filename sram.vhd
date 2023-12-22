library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity sram is
  port
  (
    clk      : in std_logic;
    wen      : in std_logic;
    addr     : in std_logic_vector(7 downto 0);
    din  : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0)
  );
end sram;

architecture Behavioural of sram is
  type cache_type is array (7 downto 0, 31 downto 0) of std_logic_vector(7 downto 0);
  -- cache is a 2d array containing 8 blocks with 32 words each as represented in figure 2
  signal cache : cache_type;
  -- grabbing index and offset from the address to index into the cache
  signal index  : integer := to_integer(unsigned(addr(7 downto 5)));
  signal offset : integer := to_integer(unsigned(addr(4 downto 0)));
begin
  process (clk)
  begin
    if (clk'event and clk = '1') then
      if (wen = '1') then
        cache(index, offset) <= din;
      end if;
        dout <= cache(index, offset);
    end if;
  end process;
end Behavioural;