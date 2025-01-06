library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex3 is
port (
		choose : in std_logic_vector(3 downto 0);
		bcd : in std_logic_vector(3 downto 0);
		anode : out std_logic_vector(3 downto 0);
		reset : in std_logic;
		ssd : out std_logic_vector(6 downto 0)

);
end ex3;

architecture Behavioral of ex3 is
begin
	process(reset,choose,bcd)
	begin
		if reset='1' then
			anode <= "0000";
			ssd <="0000000";
		else
			anode<= not choose;

			case bcd is
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
		end if;
	end process;
end Behavioral;

