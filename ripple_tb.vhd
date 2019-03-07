----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 01:07:33 PM
-- Design Name: 
-- Module Name: ripple_tb - tb
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

entity ripple_tb is
end ripple_tb;

architecture tb of ripple_tb is

component ripple_adder
port( Cin : in std_logic;
      A, B : in std_logic_vector(3 downto 0);
      S : out std_logic_vector(3 downto 0);
      Cout : out std_logic);
end component;

signal tb_A, tb_B, tb_S : std_logic_vector(3 downto 0) := (others => '0');
signal tb_Cin, tb_Cout : std_logic := '0';


begin

dut: ripple_adder port map( Cin => tb_Cin,
                            Cout => tb_Cout,
                            A => tb_A,
                            B => tb_B,
                            S => tb_S); 

process
begin

--adding 1 + 1 with no carry
tb_A <= "0001";
tb_B <= "0001";
tb_Cin <= '0';

wait for 10 ms;

--adding 12 + 3 with no carry
tb_A <= "1100";
tb_B <= "0011";
tb_Cin <= '0';

wait for 10 ms;

--adding 12 + 3 with carry
tb_A <= "1100";
tb_B <= "0011";
tb_Cin <= '1';

wait for 10 ms;

--adding 2 + 2 with input carry
tb_A <= "0010";
tb_B <= "0010";
tb_Cin <= '1';

wait for 10 ms;

--adding 0 + 0 with input carry
tb_A <= "0000";
tb_B <= "0000";
tb_Cin <= '1';

wait for 10 ms;

end process;


end tb;
