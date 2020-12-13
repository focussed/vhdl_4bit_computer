library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

entity magic is
  port (
    clk_50Mhz : in  std_logic;
    clk_2Hz   : out std_logic);
end magic;

architecture Behavioral of magic is

  signal prescaler : unsigned(23 downto 0);
  signal clk_2Hz_i : std_logic;
begin

  gen_clk : process (clk_50Mhz)
  begin  -- process gen_clk
    if rising_edge(clk_50Mhz) then   -- rising clock edge
      if prescaler = X"BEBC20" then     -- 12 500 000 in hex
        prescaler   <= (others => '0');
        clk_2Hz_i   <= not clk_2Hz_i;
      else
        prescaler <= prescaler + "1";
      end if;
    end if;
  end process gen_clk;

clk_2Hz <= clk_2Hz_i;

end Behavioral;