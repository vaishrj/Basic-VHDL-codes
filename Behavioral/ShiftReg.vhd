----------------------------------------------------------------------------------
-- Module Name: ShiftReg - Behavioral
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

entity ShiftReg is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           mode : in STD_LOGIC_VECTOR (1 downto 0);
           load : in STD_LOGIC;
           Si : in STD_LOGIC;
           Pi : in STD_LOGIC_VECTOR (3 downto 0);
           So : out STD_LOGIC;
           Po : out STD_LOGIC_VECTOR (3 downto 0));
end ShiftReg;

architecture Behavioral of ShiftReg is
signal clkout: std_logic;
signal temp: std_logic_vector(3 downto 0);
signal counter: integer range 0 to 49999999;
begin
--comment process during simulation
--process(clk,rst)
--begin
--if (rst='1') then
--clkout<='0';
--counter<=0;
--elsif(clk'event and clk='1') then
-- if(counter=49999999) then
--    clkout<= not clkout;
-- else
--    counter<=counter + 1;
--end if;
--end if;
--end process;

process(clk,rst)
begin
if (rst='1') then
    So<='0';
    Po<="0000";                                 
elsif(clk' event and clk='1') then              -- uncomment during simulation
--elsif(cklout' event and clkout='1') then      -- uncomment during normal execution
    case mode is
    when "00"=> --pipo
        po<=pi;
        so<='0';
    when "01"=>     --siso
        temp(0)<=si;
        temp(1)<=temp(0);
        temp(2)<=temp(1);
        temp(3)<=temp(2);
        so<=temp(3);
        po<="0000";
    when "10"=>   --piso
        so<='0';
        po<="0000";
        if(load='1')then
            temp<=pi;
        else
            temp(1)<=temp(0);
            temp(2)<=temp(1);
            temp(3)<=temp(2);
            so<=temp(3);
        end if;
    when "11" =>  --sipo
        so<='0';
        po<="0000";
        if (load='0') then
            temp(0)<=si;
            temp(1)<=temp(0);
            temp(2)<=temp(1);
            temp(3)<=temp(2);
         else
            po<=temp;
         end if;
      when others=>
      NULL;
     end case;
end if;
end process;    
        
            
end Behavioral;
