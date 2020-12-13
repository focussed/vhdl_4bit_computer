library ieee;
use ieee.std_logic_1164.all;

entity mux_10_4_tb is
end mux_10_4_tb;

architecture tb of mux_10_4_tb is
    signal A,L,C,K: std_logic_vector (9 downto 0);  -- inputs 
    signal M : std_logic_vector (9 downto 0);   -- outputs
    signal KEY1, KEY0: std_logic;

    component mux10_4 is
        port(
           A,L,C,K: in std_logic_vector(9 downto 0); -- 4 10-bit inputs
           M: out std_logic_vector(9 downto 0);      -- 1 10-bit output
           KEY1, KEY0: in std_logic                  -- selectors (2-bit)
        );
     end component;

begin
    -- connecting testbench signals with component
    UUT : entity work.mux10_4 port map (A => A, L => L, C => C, K => K, M => M, KEY1 => KEY1, KEY0 => KEY0);

    test_proc: process
    begin 
    -- inputs
    A <= "0000000000";
    L <= "0101010101";
    C <= "1010101010";
    K <= "1111111111";
    
    KEY1 <= '0';
    KEY0 <= '0';
    wait for 20 ns; 

    KEY1 <= '0';
    KEY0 <= '1';
    wait for 20 ns; 

    KEY1 <= '1';
    KEY0 <= '0';
    wait for 20 ns; 

    KEY1 <= '1';
    KEY0 <= '1';
    wait for 20 ns; 

    KEY1 <= '0';
    KEY1 <= '0';
    wait for 20 ns; 

    assert KEY1 = '1' and KEY1 = '1';
    wait;

    end process;
   
end tb ;

