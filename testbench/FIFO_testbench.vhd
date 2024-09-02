-- **Testbench for reference**
----------------------------------------------------------------------------------
-- Module Name: fifo_test - Behavioral
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

entity fifo_test is
--  Port ( );
end fifo_test;

architecture Behavioral of fifo_test is
component fifo 
Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           full : out STD_LOGIC;
           empty : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk,rst, we, re : std_logic;
signal full, empty: std_logic;
signal data_out: std_logic_vector(7 downto 0);
constant clk_period: time:=10ns;
begin
uut: fifo port map(
clk=>clk, rst=>rst,we=>we, re=>re, full=>full, empty=>empty, data_out=>data_out);

process
begin
clk<='1';
wait for clk_period/2;
clk<='0';
wait for clk_period/2;
end process;

stim_proc: process
begin
rst<='1';
we<='0';
re<='0';
wait for 10  ns;
rst<='0';
wait for 10ns;
we<='1';
wait for 100 ns;
we<='0';
re<='1';
wait for 100 ns;
end process;
end;
