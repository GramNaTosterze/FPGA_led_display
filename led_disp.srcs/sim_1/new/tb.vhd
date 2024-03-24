----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2024 10:36:26
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
-- components
component top
        Port(
            clk_i: in STD_LOGIC;
            btn_i: in STD_LOGIC_VECTOR (3 downto 0); -- 3-BTNL, 2-BTNC, 1-BTNR, 0-BTND
            sw_i: in STD_LOGIC_VECTOR (7 downto 0);
            led7_an_o: out STD_LOGIC_VECTOR (3 downto 0);
            led7_seg_o: out STD_LOGIC_VECTOR (7 downto 0)
        );
end component top;

-- signals
    signal clk_i: STD_LOGIC := '0';
    signal rst_i: STD_LOGIC := '0';
    signal digit_i: STD_LOGIC_VECTOR(7 downto 0) := (others => '1');
    signal btn_i: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal sw_i: STD_LOGIC_VECTOR(7 downto 0) := (others => '1');
    signal led7_an_o: STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
    signal led7_seg_o: STD_LOGIC_VECTOR(7 downto 0) := (others => '1'); 
begin

    uut: top port map (
        clk_i => clk_i,
        btn_i => btn_i,
        sw_i => sw_i,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o
    );
    
    clk_sim: process
    begin
        clk_i <= not clk_i after 20ns;
        wait for 20ns;
    end process;

    -- button loaders
    process
    begin
        btn_i(0) <= not btn_i(0) after 1us;
        wait for 1us;
    end process;
    
    process
    begin
        btn_i(1) <= not btn_i(1) after 2us;
        wait for 1us;
    end process;
    
    process
    begin
        btn_i(2) <= not btn_i(2) after 3us;
        wait for 1us;
    end process;
    
    process
    begin
        btn_i(3) <= not btn_i(3) after 4us;
        wait for 1us;
    end process;

    -- switches
    process
    begin
        sw_i(0) <= not sw_i(0) after 1us;
        wait for 1us;
    end process;
    
    process
    begin
        sw_i(1) <= not sw_i(1) after 1us;
        wait for 2us;
    end process;
    
    process
    begin
        sw_i(2) <= not sw_i(2) after 1us;
        wait for 3us;
    end process;
    
    process
    begin
        sw_i(3) <= not sw_i(3) after 1us;
        wait for 4us;
    end process;

end Behavioral;
