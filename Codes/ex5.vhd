library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ex5 is
port(
		clk1: in std_logic;
		reset: in std_logic;
		choose: in std_logic_vector(3 downto 0);
		anode: out std_logic_vector(3 downto 0);
		ssd : out std_logic_vector(6 downto 0)
	 );
end ex5;

architecture Behavioral of ex5 is
signal temp:std_logic_vector(3 downto 0);
signal count: integer :=1;
signal clk: std_logic :='0';
begin

	process(clk1)
	begin
	if rising_edge(clk1) then
		count <= count + 1;
	if (count= 100000000) then
		clk <= not clk;
		count <= 1;
	end if;
	end if;
	end process;
	
	process(clk,reset,temp)
	begin
		if reset= '1' then
			temp <= "0000";
		elsif rising_edge(clk) then
			temp <= temp + '1';
			if temp= "1001" then
				temp<= "0000";
			end if;
		end if;
	end process;
	
	process(choose)
	begin
		anode <= not choose;
--		case (choose) is
--			when "0001" => anode <= "1110";
--			when "0010" => anode <= "1101";
--			when "0100" => anode <= "1011";
--			when "1000" => anode <= "0111";
--			when others => anode <= "1111";
--		end case;
	end process;
	
	process(temp)
	begin
		case temp is
			when "0000"=> ssd <="0000001";  -- '0'
			when "0001"=> ssd <="1001111";  -- '1'
			when "0010"=> ssd <="0010010";  -- '2'
			when "0011"=> ssd <="0000110";  -- '3'
			when "0100"=> ssd <="1001100";  -- '4' 
			when "0101"=> ssd <="0100100";  -- '5'
			when "0110"=> ssd <="0100000";  -- '6'
			when "0111"=> ssd <="0001111";  -- '7'
			when "1000"=> ssd <="0000000";  -- '8'
			when "1001"=> ssd <="0000100";  -- '9'
			when others=> ssd <="1111111"; 
			end case;
	end process;

end Behavioral;

