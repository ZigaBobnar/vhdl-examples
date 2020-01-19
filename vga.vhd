library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity VGA is
	port(clock_50 : in std_logic;
		HS, VS : out std_logic;
		R, G, B : out std_logic_vector(3 downto 0));

end entity VGA;

architecture main of VGA is

component VGA_DRIVER is
	port(vga_clk : in std_logic;
		h_sync : out std_logic;
		v_sync : out std_logic;
		red : out std_logic_vector(3 downto 0);
		green : out std_logic_vector(3 downto 0);
		blue : out std_logic_vector(3 downto 0));
end component VGA_DRIVER;

begin

end;
