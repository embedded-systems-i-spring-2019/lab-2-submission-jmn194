----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 08:07:51 PM
-- Design Name: 
-- Module Name: my_alu_tb - tb
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

entity alu_tester_tb is
end alu_tester_tb;

architecture tb of alu_tester_tb is
component alu_tester
Port ( btn, sw : in std_logic_vector(3 downto 0);
       clk : in std_logic;
       led : out std_logic_vector(3 downto 0));
end component;

signal tb_btn, tb_sw, tb_led : std_logic_vector(3 downto 0);
signal tb_clk : std_logic;

begin

dut: alu_tester port map ( btn => tb_btn,
                           sw => tb_sw,
                           clk => tb_clk,
                           led => tb_led);

process
begin
tb_clk <= '1';
wait for 4 ns;
tb_clk <= '0';
wait for 4 ns;
end process;

process
begin

tb_sw <= "0011";
tb_btn <= "0010"; --set A to 3
wait for 21 ms;

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0111";
tb_btn <= "0001"; --set B to 7
wait for 21 ms;

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0000";
tb_btn <= "0100"; --set OP 0
wait for 21 ms; --output should be a

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0001";
tb_btn <= "0100"; --set OP 1
wait for 21 ms; --output should be c

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0010";
tb_btn <= "0100"; --set OP 2
wait for 21 ms; --output should be 4

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0011";
tb_btn <= "0100"; --set OP 3
wait for 21 ms; --output should be 2

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0100";
tb_btn <= "0100"; --set OP 4
wait for 21 ms; --output should be d

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0101";
tb_btn <= "0100"; --set OP 5
wait for 21 ms; --output should be 0

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0110";
tb_btn <= "0100"; --set OP 6
wait for 21 ms; --output should be 6

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "0111";
tb_btn <= "0100"; --set OP 7
wait for 21 ms; --output should be 1

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1000";
tb_btn <= "0100"; --set OP 8
wait for 21 ms; --output should be 1

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1001";
tb_btn <= "0100"; --set OP 9
wait for 21 ms; --output should be c

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1010";
tb_btn <= "0100"; --set OP 10
wait for 21 ms; --output should be 3

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1011";
tb_btn <= "0100"; --set OP 11
wait for 21 ms; --output should be 7

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1100";
tb_btn <= "0100"; --set OP 12
wait for 21 ms; --output should be 4

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1101";
tb_btn <= "0100"; --set OP 13
wait for 21 ms; --output should be b

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1110";
tb_btn <= "0100"; --set OP 14
wait for 21 ms; --output should be c

tb_btn <= "0000";
wait for 1 ms;

tb_sw <= "1111";
tb_btn <= "0100"; --set OP 15
wait for 21 ms; --output should be 8

wait for 1 ms;

tb_btn <= "1000"; --reset
wait;

end process;

end tb;