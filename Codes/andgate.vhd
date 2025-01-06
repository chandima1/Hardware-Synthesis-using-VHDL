
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity andgate is
	port ( a, b : in  std_logic;
			 c    : out std_logic
			 );
end andgate;

architecture Behavioral of andgate is

begin
 c <= a and b;

end Behavioral;

