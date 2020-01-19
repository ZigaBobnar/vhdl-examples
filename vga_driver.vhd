library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_DRIVER is
	port(vga_clk : std_logic;
		h_sync : out std_logic;
		v_sync : out std_logic;
		red : out std_logic_vector(3 downto 0);
		green : out std_logic_vector(3 downto 0);
		blue : out std_logic_vector(3 downto 0));

end entity VGA_DRIVER;
