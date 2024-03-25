----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2024 11:42:39
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port(
            clk_i: in STD_LOGIC;
            rst_i: in STD_LOGIC;
            digit_i: in STD_LOGIC_VECTOR (31 downto 0);
            led7_an_o: out STD_LOGIC_VECTOR (3 downto 0);
            led7_seg_o: out STD_LOGIC_VECTOR (7 downto 0) := (others => '1')
        );
end display;

architecture Behavioral of display is
    alias an3: STD_LOGIC_VECTOR(7 downto 0) is digit_i(31 downto 24);
    alias an2: STD_LOGIC_VECTOR(7 downto 0) is digit_i(23 downto 16);
    alias an1: STD_LOGIC_VECTOR(7 downto 0) is digit_i(15 downto 8);
    alias an0: STD_LOGIC_VECTOR(7 downto 0) is digit_i(7 downto 0);

    signal an: STD_LOGIC_VECTOR(2 downto 0) := "000";
begin

    with an select
    led7_seg_o <= an3 when "000",
        an2 when "001",
        an1 when "010",
        an0 when "011",
        (others => '1') when others;
        
    with an select
    led7_an_o <=  "0111" when "000", -- an3
        "1011" when "001",           -- an2
        "1101" when "010",           -- an1
        "1110" when "011",           -- an0
        "1111" when others; 

    multiplexer: process(clk_i, rst_i)
        constant N: integer := 2; -- 100000; -- for a 100 MHz clock
        variable counter: integer := 0;
    begin
        if rst_i = '1' then 
            an <= "000";
        elsif rising_edge(clk_i) then
            if(counter < N) then
                counter := counter+1;
            else
                counter := 0;
                if(an >= "011") then
                    an <= "000";
                else
                    an <= an+1;
                end if;
            end if;    
        end if;
    end process multiplexer;


end Behavioral;
