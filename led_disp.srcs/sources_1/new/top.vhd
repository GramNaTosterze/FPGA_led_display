----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2024 22:41:01
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port(
        clk_i: in STD_LOGIC;
        btn_i: in STD_LOGIC_VECTOR (3 downto 0); -- 3-BTNL, 2-BTNC, 1-BTNR, 0-BTND
        sw_i: in STD_LOGIC_VECTOR (7 downto 0);
        led7_an_o: out STD_LOGIC_VECTOR (3 downto 0) := (others => '1');
        led7_seg_o: out STD_LOGIC_VECTOR (7 downto 0) := (others => '1') 
    );
end top;

architecture Behavioral of top is
component display
    Port(
        clk_i: in STD_LOGIC;
        rst_i: in STD_LOGIC;
        digit_i: in STD_LOGIC_VECTOR(31 downto 0);
        led7_an_o: out STD_LOGIC_VECTOR(3 downto 0);
        led7_seg_o: out STD_LOGIC_VECTOR(7 downto 0)
    );
end component display;
component encoder
    Port(
        clk_i: in STD_LOGIC;
        btn_i: in STD_LOGIC_VECTOR(3 downto 0);
        sw_i: in STD_LOGIC_VECTOR(7 downto 0);
        digit_o: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component encoder;

    signal digit: STD_LOGIC_VECTOR(31 downto 0) := (others => '1');
begin

    enc: encoder port map(
        clk_i => clk_i,
        btn_i => btn_i,
        sw_i => sw_i,
        digit_o => digit
    );

    disp: display port map(
        clk_i => clk_i,
        rst_i => '0',
        digit_i => digit,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o
    );

end Behavioral;
