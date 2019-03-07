----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 06:19:44 PM
-- Design Name: 
-- Module Name: my_alu - alu
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
Port (A, B, op : in std_logic_vector(3 downto 0);
      outp : out std_logic_vector(3 downto 0));
end my_alu;

architecture alu of my_alu is

signal Asig, Bsig, output : unsigned(3 downto 0);

begin

Asig <= unsigned(A);
Bsig <= unsigned(B);

process (Asig, Bsig, op)
begin
case (op) is
  when "0000" => output <= Asig + Bsig;
  when "0001" => output <= Asig - Bsig;
  when "0010" => output <= Asig + "0001";
  when "0011" => output <= Asig - "0001";
  when "0100" => output <= 0 - Asig;
  when "0101" => 
        if ( Asig > Bsig) then
          output <= "0001";
        elsif (Asig < Bsig) then 
          output <= "0000";
        else
          output <= (others => '0');
        end if;
  when "0110" => output <= Asig(2) & Asig(1) & Asig(0) & '0';
  when "0111" => output <= '0' & Asig(3) & Asig(2) & Asig(1);
  when "1000" => 
        if ( Asig > "0111") then
          output <= '1' & Asig(3) & Asig(2) & Asig(1);
        else
          output <= '0' & Asig(3) & Asig(2) & Asig(1);
        end if;
  when "1001" => output <= not Asig;
  when "1010" => output <= Asig and Bsig;
  when "1011" => output <= Asig or Bsig;
  when "1100" => output <= Asig xor Bsig;
  when "1101" => output <= Asig xnor Bsig;
  when "1110" => output <= Asig nand Bsig;
  when "1111" => output <= Asig nor Bsig;
  when others => output <= "0000";
end case;

end process;
outp <= std_logic_vector(output);
end alu;
