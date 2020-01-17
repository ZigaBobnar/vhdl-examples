library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_mod_5_up is
	port(clk : in STD_LOGIC;
		q : out STD_LOGIC_VECTOR(2 downto 0));

end counter_mod_5_up;

architecture behavioral of counter_mod_5_up is
	signal D, R : STD_LOGIC_VECTOR(2 downto 0);

begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			R <= D;
		end if;
	end process;
	
	D <= "000" when R="100" else
		R+1;
	q <= R;

end behavioral;
