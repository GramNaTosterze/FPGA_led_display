----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2024 11:46:11
-- Design Name: 
-- Module Name: encoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder is
    Port(
        clk_i: in STD_LOGIC;
        btn_i: in STD_LOGIC_VECTOR (3 downto 0); -- 3-BTNL, 2-BTNC, 1-BTNR, 0-BTND
        sw_i: in STD_LOGIC_VECTOR (7 downto 0);
        digit_o: out STD_LOGIC_VECTOR (31 downto 0)
    );
end encoder;

architecture Behavioral of encoder is
    signal num: STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
begin
    with sw_i(3 downto 0) select
    num <= "0000000" when "0000",
        "0000000" when "0001",
        "0000000" when "0010",
        "0000000" when "0011",
        "0000000" when "0100",
        "0000000" when "0101",
        "0000000" when "0110",
        "0000000" when "0111",
        "0000000" when "1000",
        "0000000" when "1001",
        "0000000" when "1010",
        "0000000" when "1011",
        "0000000" when "1100",
        "0000000" when "1101",
        "0000000" when "1110",
        "0000000" when "1111",
        "1111111" when others;

    digits: process(clk_i, btn_i, sw_i)
    begin
        
        if rising_edge(clk_i) then
        
            if btn_i(0) = '1' then
                digit_o(7 downto 1) <= num;
            end if;
        
            if btn_i(1) = '1' then
                digit_o(15 downto 9) <= num;
            end if;
            
            if btn_i(2) = '1' then
                digit_o(23 downto 17) <= num;
            end if;
            
            if btn_i(3) = '1' then
                digit_o(31 downto 25) <= num;
            end if;
        
        end if;
    
        -- set dots on display
        digit_o(0) <= not sw_i(4);
        digit_o(8) <= not sw_i(5);
        digit_o(16) <= not sw_i(6);
        digit_o(24) <= not sw_i(7);
    
    
    end process;

end Behavioral;
