library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divider is
	port(clkin : in STD_LOGIC;
		clk : out STD_LOGIC);

end divider;

architecture behavioral of divider is
	signal R1, D1 : STD_LOGIC_VECTOR(6 downto 0);
	signal a1, t1 : STD_LOGIC;
	signal R2, D2 : STD_LOGIC_VECTOR(19 downto 0);
	signal a2, t2 : STD_LOGIC;

begin
	process(clkin)
	begin
		if (clkin'event and clkin='1') then
			R1 <= D1;
			a1 <= t1;
		end if;

		if (a1'event and a1='1') then
			R2 <= D2;
			a2 <= t2;
		end if;
	end process;

	D1 <= (others => '0') when R1="110001" else R1+1;
	t1 <= not(a1) when R1="110001" else a1;
	D2 <= (others => '0') when R2="1111010000100011111" else R2+1;
	t2 <= not(a2) when R2="1111010000100011111" else a2;
	clk <= a2;
end behavioral;
