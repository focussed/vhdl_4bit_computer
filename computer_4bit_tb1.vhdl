library ieee;
use ieee.std_logic_1164.all;

entity computer_4bit_tb1 is
end computer_4bit_tb1;

architecture tb of computer_4bit_tb1 is
    signal num1, num2: std_logic_vector (3 downto 0);  -- inputs 
    signal nout : std_logic_vector (3 downto 0);   -- outputs

    component orGate        -- parameters must match orGate entity
    port(A : in std_logic_vector (3 downto 0);      -- OR gate input
         B : in std_logic_vector (3 downto 0);      -- OR gate input
         Y : out std_logic_vector (3 downto 0)      -- OR gate output
         );    
    end component; 

begin
    -- connecting testbench signals with computer_4bit component
    UUT : entity work.orGate port map (A => num1 , B => num2, Y => nout);

    -- inputs
    num1 <= "0001", "0010" after 20 ns, "0010" after 40 ns, "0110" after 60 ns, "0000" after 80 ns;
    num2 <= "1000", "0100" after 20 ns, "1111" after 40 ns, "0000" after 60 ns, "0000" after 80 ns;        
end tb ;

