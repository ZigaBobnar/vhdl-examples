library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity VGA is
	port(clock_50 : in std_logic;
		HS, VS : out std_logic;
		R, G, B : out std_logic_vector(3 downto 0));

end entity VGA;
