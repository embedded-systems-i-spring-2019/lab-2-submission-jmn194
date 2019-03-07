----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 12:10:06 PM
-- Design Name: 
-- Module Name: ripple_adder - ripple
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

entity ripple_adder is
port( Cin : in std_logic;
      A, B : in std_logic_vector(3 downto 0);
      S : out std_logic_vector(3 downto 0);
      Cout : out std_logic);
end ripple_adder;

architecture ripple of ripple_adder is

component adder
port ( A, B, Cin : in std_logic;
       Y, Cout : out std_logic);
end component;

signal C : std_logic_vector(3 downto 0) := (others => '0');

begin

adder1: adder port map ( A => A(0),
                         B => B(0),
                         Cin => Cin,
                         Y => S(0),
                         Cout => C(0));
                         
adder2: adder port map ( A => A(1),
                         B => B(1),
                         Cin => C(0), 
                         Y => S(1),
                         Cout => C(1));
                         
adder3: adder port map ( A => A(2),
                         B => B(2), 
                         Cin => C(1),
                         Y => S(2),
                         Cout => C(2));
                         
adder4: adder port map ( A => A(3), 
                         B => B(3), 
                         Cin => C(2),
                         Y => S(3),
                         Cout => C(3));
Cout <= C(3);

end ripple;
