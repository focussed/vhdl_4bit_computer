-- VHDL Code for 4 bit OR gate
-- Header file declaration

library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity orGate is
    port(A : in std_logic_vector (3 downto 0);      -- OR gate input
         B : in std_logic_vector (3 downto 0);      -- OR gate input
         Y : out std_logic_vector (3 downto 0)      -- OR gate output
         );    
end orGate;

-- Architecture definition

architecture orLogic of orGate is
begin  
    Y <= A OR B;        -- A= 1001, B= 0011,  Y= 1011
end orLogic;