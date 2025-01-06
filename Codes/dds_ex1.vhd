library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dds_ex1 is
port(
	  clk1: in std_logic;
	  reset:in std_logic;
	  choose_up: in std_logic;
	  choose_down: in std_logic;   
--	  freq: in std_logic_vector(3 downto 0);
     led: out std_logic_vector(7 downto 0);
	  output: out std_logic_vector(7 downto 0)
);
end dds_ex1;

architecture Behavioral of dds_ex1 is
signal temp:std_logic_vector(7 downto 0);
signal count: integer :=1;
--signal frequency: integer :=1000000;
signal clk: std_logic :='0';
signal change: std_logic :='0';
begin
	
--	process(clk1,freq)
--	begin
--	if rising_edge(clk1) then
--		case freq is
--			when "0001"=> frequency <=1000000; 
--			when "0010"=> frequency <=10000;
--			when "0100"=> frequency <=100; 
--			when "1000"=> frequency <=1; 
--			when others=> frequency <=50000000;
--		end case;
--	end if;
--	end process;
	
	process(clk1)
	begin	 
		if rising_edge(clk1) then
				count <= count + 1;	
--				frequency<=10000000;
			if (count= 1000) then
				clk <= not clk;
				count <= 1;
			end if;
		end if;
   end process;
	
	process(clk,reset,temp,choose_up,choose_down,change)
	begin
		if (reset= '1') then
			temp<= (others=> '0');
		elsif rising_edge(clk) then
			if choose_up='1' and choose_down= '0' then
				temp<= temp + '1';
				if temp="11111111" then
					temp<="00000000";
				end if;
			elsif choose_up='0' and choose_down= '1' then
				temp<= temp - '1';
				if temp="00000000" then
					temp<="11111111";
				end if;
			elsif choose_up='1' and choose_down= '1' then
				if change='0' then
					if temp="11111111" then
						change<='1';
					else
						temp<= temp + '1';
					end if;
				elsif change='1' then
						if temp="00000000" then
							change<='0';
						else
							temp<= temp - '1';
						end if;
				end if;
			end if;
		end if;
	end process;
output<=temp; --change the outputs in the ucf file from the LED to the JA and JB ports when connecting the R-2R ladder
led<=temp;
end Behavioral;

