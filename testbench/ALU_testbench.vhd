-- **Testbench for reference**
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2023 00:16:18
-- Design Name: 
-- Module Name: ALU_testbench - Behavioral
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

entity ALU_testbench is
    
end ALU_testbench;

architecture Behavioral of ALU_testbench is
component ALU
PORT(
       A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0);
       flag : out std_logic);
end component;
--inputs
signal A: std_logic_vector(3 downto 0):= (others =>'0');
signal B: std_logic_vector(3 downto 0):= (others =>'0');
signal S: std_logic_vector(2 downto 0):= (others =>'0');
--output
signal Y: std_logic_vector(3 downto 0);
signal flag: std_logic;

begin
uut: ALU port map(
A=>A, B=>B, S=>S, Y=>Y, flag=>flag);
stim_proc:process
begin
 A<="0010";
 B<="0001";
 S<="101";
 wait for 10ns;
 S<="001";
 wait for 10ns;
 end process;
 END;
 

