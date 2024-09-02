-- **Testbench for reference**
----------------------------------------------------------------------------------
-- Module Name: modN - Behavioral
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

entity modN_test is
--  Port ( );
end modN_test;

architecture Behavioral of modN_test is
component modN port(
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));  --4bit counter
end component;

signal rst, en, clk: std_logic;
signal Q: std_logic_vector(3 downto 0);
constant clk_period:time:=10ns;
begin
uut: modN port map(clk=>clk, rst=>rst, en=>en, Q=>Q);
process
begin
clk<='0';
wait for clk_period/2;
clk<='1';
wait for clk_period/2;
end process;
stim_proc:process
begin
rst<='1';
wait for 10ns;
rst<='0';
wait for 10ns;
en<='1';
wait for 50ns;
en<='0';
wait for 20 ns;
end process;
end;

