library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity light is
	port(x1, x2 : IN STD_LOGIC;
		f : OUT STD_LOGIC);
end light;


architecture func of light is
begin
	f <= (x1 and not x2) or (not x1 and x2);
end func;
