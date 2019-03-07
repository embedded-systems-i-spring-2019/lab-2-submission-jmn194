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

entity alu_tester is
Port ( btn, sw : in std_logic_vector(3 downto 0);
       clk : in std_logic;
       led : out std_logic_vector(3 downto 0));
end alu_tester;

architecture tb of alu_tester is
component my_alu
Port (A, B, op : in std_logic_vector(3 downto 0);
      outp : out std_logic_vector(3 downto 0));
end component;

component Debounce
Port (btn, clk : in std_logic;
      dbnc : out std_logic);
end component;

signal Asig, Bsig, OPsig, outsig, dbnc : std_logic_vector(3 downto 0);

begin
ALU: my_alu port map ( A => Asig,
                    B => Bsig,
                    op => OPsig,
                    outp => led);

u1: debounce port map ( btn => btn(0),
                        clk => clk,
                        dbnc => dbnc(0));

u2: debounce port map ( btn => btn(1),
                        clk => clk,
                        dbnc => dbnc(1));
                        
u3: debounce port map ( btn => btn(2),
                        clk => clk,
                        dbnc => dbnc(2));
                        
u4: debounce port map ( btn => btn(3),
                        clk => clk,
                        dbnc => dbnc(3));                        
                        

process(clk)
begin
if rising_edge(clk) then
  if (dbnc(3) = '1') then
    Asig <= "0000";
    Bsig <= "0000";
    OPsig <= "0000";
   elsif (dbnc(2) = '1') then
    OPsig <= sw;
  elsif (dbnc(1) = '1') then
    Asig <= sw;
  elsif (dbnc(0) = '1') then
    Bsig <= sw;
  else
  end if;
end if;
end process;

end tb;