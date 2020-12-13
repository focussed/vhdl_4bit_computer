library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.numeric_std.all;
 
 entity magic2clk is
    Port ( 
           refclk : in  std_logic;
           K : out std_logic_vector (9 downto 0)
    );
 end magic2clk;
 
 architecture RTL of magic2clk is
    constant max_count : natural := 50000000;
    signal Rst : std_logic;
 begin

    Rst <= '0';
 
    -- 0 to max_count counter
    compteur : process(refclk, Rst)
        variable count : natural range 0 to max_count;
    begin
        if Rst = '1' then
            count := 0;
            K <= "1111111111";
        elsif rising_edge(refclk) then
            if count < max_count/2 then
                count := count + 1;
                K <= "1111111111";
            elsif count < max_count then
                K <= "0000000000";
                count := count + 1;
            else
                K <= "1111111111";
                count := 0;
            end if;
        end if;
    end process compteur; 
 end RTL;