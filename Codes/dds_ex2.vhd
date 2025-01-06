library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dds_ex2 is
port(
		bcd : in std_logic_vector(3 downto 0);
		clk1: in std_logic;
		reset:in std_logic;
		choose_up: in std_logic;
		choose_down: in std_logic;
		output: out std_logic_vector(7 downto 0);
		comp : out std_logic_vector(3 downto 0) -- comparator out
);
end dds_ex2;

architecture Behavioral of dds_ex2 is
signal temp:std_logic_vector(7 downto 0);
signal count: integer :=1;
signal clk: std_logic :='0';
signal change: std_logic :='0';
begin
	process(clk1)
	begin	 
	if rising_edge(clk1) then
		count <= count + 1;	
	if (count= 250) then
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
	
	process (bcd)
	begin
		case bcd is
			when "0000"=> comp <="0000";  -- '0'
			when "0001"=> comp <="0001";  -- '1'
			when "0010"=> comp <="0010";  -- '2'
			when "0011"=> comp <="0011";  -- '3'
			when "0100"=> comp <="0100";  -- '4' 
			when "0101"=> comp <="0101";  -- '5'
			when "0110"=> comp <="0110";  -- '6'
			when "0111"=> comp <="0111";  -- '7'
			when "1000"=> comp <="1000";  -- '8'
			when "1001"=> comp <="1001";  -- '9'
			when "1010"=> comp <="1010";  -- '10'
			when "1011"=> comp <="1011";  -- '11'
			when "1100"=> comp <="1100";  -- '12'
			when "1101"=> comp <="1101";  -- '13'
			when "1110"=> comp <="1110";  -- '14'
			when others=> comp <="1111"; -- '15'
		end case;
	end process;
	
output<=temp; --change the outputs in the ucf file from the LED to the JA and JB ports when connecting the R-2R ladder

end Behavioral;

