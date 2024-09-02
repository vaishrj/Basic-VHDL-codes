----------------------------------------------------------------------------------
-- Module Name: fifo - Behavioral

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           we : in STD_LOGIC;
           re : in STD_LOGIC;
           full : out STD_LOGIC;
           empty : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end fifo;

architecture Behavioral of fifo is

signal wptr:integer range 0 to 7;
signal rptr: integer range -1 to 7;
type fifo1 is array(0 to 7) of std_logic_vector(7 downto 0);
signal memory:fifo1;
type data_in is array(0 to 7) of std_logic_vector(7 downto 0);
signal data: data_in :=("10000000","01000000","00100000","00010000","00001000","00000100","00000010","00000001");
signal clkout: std_logic;
signal count: integer range 0 to 49999999;

begin
--comment below process for simulation
process(clk,rst)
begin
if (rst='1') then
    clkout<='0';
    count<=0;
elsif(clk' event and clk='1') then
    if (count=49999999) then
        clkout<=not clkout;
        count<=0;
     else
        count<=count+1;
     end if;
end if;
end process;     

--process(clkout,rst,we,re)
process(clk,rst,we,re)  --simulation
begin
if(rst='1') then
    for i in 0 to 7 loop 
    memory(i)<="00000000";
    end loop;
    empty<='1';
    full<='0';
    wptr<=0;
    rptr<=0;
--elsif rising_edge(clkout) then
elsif rising_edge(clk) then  --simulation
    if(we='1') then
        rptr<=0;
        memory(wptr)<=data(wptr);
        empty<='0';
            if(wptr=7) then
                wptr<=0;
                full<='1';
            else
                wptr<=wptr+1;
            end if;
     elsif(re='1') then
        if(rptr>-1) then
            data_out<=memory(rptr);
            full<='0';
            memory(rptr)<="ZZZZZZZZ";
                if(rptr=7 or memory(rptr)="ZZZZZZZZ") then
                    rptr<=-1;
                    empty<='1';
                    wptr<=0;
                else
                    full<='0';
                    rptr<=rptr+1;
                end if;         
        else
            data_out<="ZZZZZZZZ";
            empty<='1';
        end if;
    else 
     data_out<="ZZZZZZZZ";
end if;
end if;
end process;
end Behavioral;
