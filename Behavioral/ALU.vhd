----------------------------------------------------------------------------------

-- Module Name: ALU - Behavioral
--4 bit ALU
-- functions implemented :
--   opcode  function
--   000     a + b
--   001     a - b
--   010     a and b
--   011     a nand b
--   100     a or b
--   101     a xor b
--   110     a xnor b
--   111     a nor b
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           flag: out Std_logic);
end ALU;

architecture Behavioral of ALU is
signal temp: std_logic_vector(4 downto 0) := "00000";
begin
process(A,B,S)
begin
case S is
when "000"=>
temp<=('0' & A)+ B;
Y<=temp(3 downto 0);
flag <=temp(4);
when "001"=>
flag<='0';
if (a>b) then 
 Y<= a-b;
else
 Y<= b-a;
end if;
when "010"=>
flag<='0';
Y<= A and B;
when "011"=>
flag<='0';
Y<= A nand B;
when "100"=>
flag<='0';
Y<= A or B;
when "101"=>
flag<='0';
Y<= A xor B;
when "110"=>
flag<='0';
Y<= A xnor B;
when "111"=>
flag<='0';
Y<= A nor B;
when others=>
NULL;
end case;
end process;
end Behavioral;

	 
