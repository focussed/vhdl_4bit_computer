library ieee;
use ieee.std_logic_1164.all;

entity hexToSevenSegment_tb is
end hexToSevenSegment_tb;

architecture tb of hexToSevenSegment_tb is
    signal num1, num2: std_logic_vector (3 downto 0);  -- inputs 
    signal segment : std_logic_vector (6 downto 0);   -- outputs

    component hexToSevenSegment is
        port(
            hexNumber : in std_logic_vector(3 downto 0);
            sevenSegmentActiveLow, sevenSegmentActiveHigh : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    -- connecting testbench signals with computer_4bit component
    UUT : entity work.hexToSevenSegment port map (hexNumber => num1, sevenSegmentActiveHigh => segment);

    -- inputs
    num1 <= "0001", 
            "0011" after 20 ns, 
            "0111" after 40 ns, 
            "1111" after 60 ns, 
            "0000" after 80 ns,
            "0010" after 100 ns, 
            "0110" after 120 ns, 
            "1110" after 140 ns, 
            "1110" after 160 ns,
            "0000" after 180 ns;        
end tb ;

