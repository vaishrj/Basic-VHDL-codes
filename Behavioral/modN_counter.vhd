----------------------------------------------------------------------------------
-- Module Name: modN - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity modN is
generic(N: integer:=4);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end modN;

architecture Behavioral of modN is
signal clkout:std_logic;
signal count: integer range 0 to 49999999:=0;
signal count1: std_logic_vector(N-1 downto 0);

begin
--section commented during simulation
--process(clk ,rst)
--begin
--if(rst='1') then
--    count <=0;
--    clkout<='0';
--elsif(clk' event and clk='1') then
--    if (count=49999999) then
--        clkout<= not clkout;
--        count<=0;
--    else
--        count<= count+1;
--    end if;
--end if; 
--end process;

process(clk,rst)        --uncomment during simulation
--process(clkout,rst)   --uncomment during implementation
begin
if(rst='1') then
    count1<=(others=>'0');
elsif(clk' event and clk='1')then               --uncomment during simulation
--elsif(clkout' event and clkout='1')then       --uncomment during implementation
    if(en='1')then
        count1<=count1+1;
    else
        count1<=(others=>'0');
    end if;
end if;
Q<=count1;
end process;
end Behavioral;
