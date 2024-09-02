----------------------------------------------------------------------------------
-- Module Name: ShiftReg_test - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftReg_test is
--  Port ( );
end ShiftReg_test;

architecture Behavioral of ShiftReg_test is
component ShiftReg port(
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    mode : in STD_LOGIC_VECTOR (1 downto 0);
    load : in STD_LOGIC;
    Si : in STD_LOGIC;
    Pi : in STD_LOGIC_VECTOR (3 downto 0);
    So : out STD_LOGIC;
    Po : out STD_LOGIC_VECTOR (3 downto 0));
end component;
 
signal clk : STD_LOGIC;
signal rst : STD_LOGIC;
signal mode :STD_LOGIC_VECTOR (1 downto 0);
signal load :STD_LOGIC;
signal Si :  STD_LOGIC;
signal Pi :  STD_LOGIC_VECTOR (3 downto 0);
signal So :  STD_LOGIC;
signal Po :  STD_LOGIC_VECTOR (3 downto 0);

constant clk_period: time:= 10 ns;

begin
uut : ShiftReg port map(
clk=>clk, rst=>rst, mode=>mode, load=> load,si=>si, pi=>pi,so=>so, po=>po);

process 
begin
clk<='0';
wait for clk_period/2;
clk<='1';
wait for clk_period/2;
end process;

stim_proc: process
begin
    rst<='1';
    wait for 10ns;
    rst<='0';
    wait for 10ns;
    mode <="00";    	--parallel in parallel out
    pi<="0001";
    wait for 20ns;
    mode<="01";     	--serial in serial out
    si<='1';
    wait for 50ns;
    mode<="10";     	--parallel in serial out
    load<='1';
    pi<="1010";
    wait for 20 ns;
    load<='0';
    wait for 50ns;
    mode<="11";     	--serial in parallel out
    load<='0';
    si<='1';
    wait for 20ns;
    load <='1';
    wait for 50ns;
end process;
end;

