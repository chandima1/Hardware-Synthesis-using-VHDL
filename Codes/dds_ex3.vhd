library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dds_ex3 is
port(
	  clk1: in std_logic;
	  reset:in std_logic;  
     led: out std_logic_vector(7 downto 0);
	  output: out std_logic_vector(7 downto 0)
);
end dds_ex3;

architecture Behavioral of dds_ex3 is
signal temp:std_logic_vector(7 downto 0);
signal c_up: std_logic :='1';
signal count: integer :=1;
signal clk: std_logic :='0';
signal val: integer :=1;
signal sin: std_logic_vector(7 downto 0);
begin
	process(clk1)
	begin	 
		if rising_edge(clk1) then
				count <= count + 1;	
			if (count= 1000) then
				clk <= not clk;
				count <= 1;
			end if;
		end if;
   end process;

	process(val)
	begin
		case val is
			when	1	=>	sin	<=	"10000000";	
			when	2	=>	sin	<=	"10000010";
			when	3	=>	sin	<=	"10000100";
			when	4	=>	sin	<=	"10000110";
			when	5	=>	sin	<=	"10001000";
			when	6	=>	sin	<=	"10001011";
			when	7	=>	sin	<=	"10001101";
			when	8	=>	sin	<=	"10001111";
			when	9	=>	sin	<=	"10010001";
			when	10	=>	sin	<=	"10010011";
			when	11	=>	sin	<=	"10010110";
			when	12	=>	sin	<=	"10011000";
			when	13	=>	sin	<=	"10011010";
			when	14	=>	sin	<=	"10011100";
			when	15	=>	sin	<=	"10011110";
			when	16	=>	sin	<=	"10100000";
			when	17	=>	sin	<=	"10100011";
			when	18	=>	sin	<=	"10100101";
			when	19	=>	sin	<=	"10100111";
			when	20	=>	sin	<=	"10101001";
			when	21	=>	sin	<=	"10101011";
			when	22	=>	sin	<=	"10101101";
			when	23	=>	sin	<=	"10101111";
			when	24	=>	sin	<=	"10110001";
			when	25	=>	sin	<=	"10110011";
			when	26	=>	sin	<=	"10110101";
			when	27	=>	sin	<=	"10110111";
			when	28	=>	sin	<=	"10111001";
			when	29	=>	sin	<=	"10111011";
			when	30	=>	sin	<=	"10111101";
			when	31	=>	sin	<=	"10111111";
			when	32	=>	sin	<=	"11000001";
			when	33	=>	sin	<=	"11000011";
			when	34	=>	sin	<=	"11000101";
			when	35	=>	sin	<=	"11000111";
			when	36	=>	sin	<=	"11001000";
			when	37	=>	sin	<=	"11001010";
			when	38	=>	sin	<=	"11001100";
			when	39	=>	sin	<=	"11001110";
			when	40	=>	sin	<=	"11001111";
			when	41	=>	sin	<=	"11010001";
			when	42	=>	sin	<=	"11010011";
			when	43	=>	sin	<=	"11010100";
			when	44	=>	sin	<=	"11010110";
			when	45	=>	sin	<=	"11011000";
			when	46	=>	sin	<=	"11011001";
			when	47	=>	sin	<=	"11011011";
			when	48	=>	sin	<=	"11011100";
			when	49	=>	sin	<=	"11011110";
			when	50	=>	sin	<=	"11011111";
			when	51	=>	sin	<=	"11100001";
			when	52	=>	sin	<=	"11100010";
			when	53	=>	sin	<=	"11100100";
			when	54	=>	sin	<=	"11100101";
			when	55	=>	sin	<=	"11100110";
			when	56	=>	sin	<=	"11101000";
			when	57	=>	sin	<=	"11101001";
			when	58	=>	sin	<=	"11101010";
			when	59	=>	sin	<=	"11101011";
			when	60	=>	sin	<=	"11101100";
			when	61	=>	sin	<=	"11101101";
			when	62	=>	sin	<=	"11101111";
			when	63	=>	sin	<=	"11110000";
			when	64	=>	sin	<=	"11110001";
			when	65	=>	sin	<=	"11110010";
			when	66	=>	sin	<=	"11110011";
			when	67	=>	sin	<=	"11110100";
			when	68	=>	sin	<=	"11110100";
			when	69	=>	sin	<=	"11110101";
			when	70	=>	sin	<=	"11110110";
			when	71	=>	sin	<=	"11110111";
			when	72	=>	sin	<=	"11111000";
			when	73	=>	sin	<=	"11111000";
			when	74	=>	sin	<=	"11111001";
			when	75	=>	sin	<=	"11111010";
			when	76	=>	sin	<=	"11111010";
			when	77	=>	sin	<=	"11111011";
			when	78	=>	sin	<=	"11111011";
			when	79	=>	sin	<=	"11111100";
			when	80	=>	sin	<=	"11111100";
			when	81	=>	sin	<=	"11111101";
			when	82	=>	sin	<=	"11111101";
			when	83	=>	sin	<=	"11111101";
			when	84	=>	sin	<=	"11111110";
			when	85	=>	sin	<=	"11111110";
			when	86	=>	sin	<=	"11111110";
			when	87	=>	sin	<=	"11111110";
			when	88	=>	sin	<=	"11111110";
			when	89	=>	sin	<=	"11111110";
			when	90	=>	sin	<=	"11111110";
			when	91	=>	sin	<=	"11111111";
			when	92	=>	sin	<=	"11111110";
			when	93	=>	sin	<=	"11111110";
			when	94	=>	sin	<=	"11111110";
			when	95	=>	sin	<=	"11111110";
			when	96	=>	sin	<=	"11111110";
			when	97	=>	sin	<=	"11111110";
			when	98	=>	sin	<=	"11111110";
			when	99	=>	sin	<=	"11111010";
			when	100	=>	sin	<=	"11111101";
			when	101	=>	sin	<=	"11111101";
			when	102	=>	sin	<=	"11111100";
			when	103	=>	sin	<=	"11111100";
			when	104	=>	sin	<=	"11111011";
			when	105	=>	sin	<=	"11111011";
			when	106	=>	sin	<=	"11111010";
			when	107	=>	sin	<=	"11111010";
			when	108	=>	sin	<=	"11111001";
			when	109	=>	sin	<=	"11111000";
			when	110	=>	sin	<=	"11111000";
			when	111	=>	sin	<=	"11110111";
			when	112	=>	sin	<=	"11110110";
			when	113	=>	sin	<=	"11110101";
			when	114	=>	sin	<=	"11110100";
			when	115	=>	sin	<=	"11110100";
			when	116	=>	sin	<=	"11110011";
			when	117	=>	sin	<=	"11110010";
			when	118	=>	sin	<=	"11110001";
			when	119	=>	sin	<=	"11110000";
			when	120	=>	sin	<=	"11101111";
			when	121	=>	sin	<=	"11101101";
			when	122	=>	sin	<=	"11101100";
			when	123	=>	sin	<=	"11101011";
			when	124	=>	sin	<=	"11101010";
			when	125	=>	sin	<=	"11101001";
			when	126	=>	sin	<=	"11101000";
			when	127	=>	sin	<=	"11100110";
			when	128	=>	sin	<=	"11100101";
			when	129	=>	sin	<=	"11100100";
			when	130	=>	sin	<=	"11100010";
			when	131	=>	sin	<=	"11100001";
			when	132	=>	sin	<=	"11011111";
			when	133	=>	sin	<=	"11011110";
			when	134	=>	sin	<=	"11011100";
			when	135	=>	sin	<=	"11011011";
			when	136	=>	sin	<=	"11011001";
			when	137	=>	sin	<=	"11011000";
			when	138	=>	sin	<=	"11010110";
			when	139	=>	sin	<=	"11010100";
			when	140	=>	sin	<=	"11010011";
			when	141	=>	sin	<=	"11010001";
			when	142	=>	sin	<=	"11001111";
			when	143	=>	sin	<=	"11001110";
			when	144	=>	sin	<=	"11001100";
			when	145	=>	sin	<=	"11001010";
			when	146	=>	sin	<=	"11001000";
			when	147	=>	sin	<=	"11000111";
			when	148	=>	sin	<=	"11000101";
			when	149	=>	sin	<=	"11000011";
			when	150	=>	sin	<=	"11000001";
			when	151	=>	sin	<=	"10111111";
			when	152	=>	sin	<=	"10111101";
			when	153	=>	sin	<=	"10111011";
			when	154	=>	sin	<=	"10111001";
			when	155	=>	sin	<=	"10110111";
			when	156	=>	sin	<=	"10110101";
			when	157	=>	sin	<=	"10110011";
			when	158	=>	sin	<=	"10110001";
			when	159	=>	sin	<=	"10101111";
			when	160	=>	sin	<=	"10101101";
			when	161	=>	sin	<=	"10101011";
			when	162	=>	sin	<=	"10101001";
			when	163	=>	sin	<=	"10100111";
			when	164	=>	sin	<=	"10100101";
			when	165	=>	sin	<=	"10100011";
			when	166	=>	sin	<=	"10100000";
			when	167	=>	sin	<=	"10011110";
			when	168	=>	sin	<=	"10011100";
			when	169	=>	sin	<=	"10011010";
			when	170	=>	sin	<=	"10011000";
			when	171	=>	sin	<=	"10010110";
			when	172	=>	sin	<=	"10010011";
			when	173	=>	sin	<=	"10010001";
			when	174	=>	sin	<=	"10001111";
			when	175	=>	sin	<=	"10001101";
			when	176	=>	sin	<=	"10001011";
			when	177	=>	sin	<=	"10001000";
			when	178	=>	sin	<=	"10000110";	
			when	179	=>	sin	<=	"10000100";	
			when	180	=>	sin	<=	"10000010";
			when	181	=>	sin	<=	"10000000";
			when others => 
		end case;
	end process;
		
	process(clk,reset,val)
	begin
		if (reset= '1') then
			temp<= (others=> '0');
		elsif rising_edge(clk) then
			if  c_up = '1' then
				temp<= sin;
				val <= val + 1;
					if val=181 then
						c_up<= '0'; 
						val <= 1;
					end if;
			else	
				temp<= "11111111"-sin;
				val <= val + 1;
					if val=181 then
						c_up<= '1'; 
						val <= 1;
					end if;
			end if;
		end if;
	end process;
	
led <= temp;	
output<= temp;		

end Behavioral;

