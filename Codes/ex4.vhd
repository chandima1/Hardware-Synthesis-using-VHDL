library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test4 is
   port( 
 	 clk1: in std_logic;
 	 Reset: in std_logic;
 	 Output: out std_logic_vector(3 downto 0)
	 );
end test4;

architecture Behavioral of test4 is
signal temp: std_logic_vector(3 downto 0);
signal count : integer :=1;
signal clk : std_logic :='0';
begin   

process(clk1)
begin
	if rising_edge(clk1) then
	count <=count+1;
	if(count = 50000000) then
	clk <= not clk;
	count <=1;
	end if;
	end if;
end process;

process(clk,Reset,temp)
   begin
      if Reset='1' then
         temp <= "0000";
      elsif rising_edge(clk) then
			temp <= temp + '1';
         if temp="1001" then
               temp<="0000";
			end if;
	  end if;
   end process;
   Output <= temp;
end Behavioral;

