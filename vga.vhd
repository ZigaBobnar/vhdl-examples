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
		blue : out std_logic_vector(3 downto 0);
		
		request_frame : out std_logic;
		current_h : out integer range 0 to 2256:=0;
		current_v : out integer range 0 to 1087:=0;

		red_in : in std_logic_vector(3 downto 0);
		green_in : in std_logic_vector(3 downto 0);
		blue_in : in std_logic_vector(3 downto 0));

end component VGA_DRIVER;

signal vga_clk : std_logic := '0';
signal request_frame : std_logic := '0';
signal set_red, set_green, set_blue : std_logic_vector(3 downto 0) := (others => 0);
signal hpos : integer range 0 to 2256 := '0';
signal vpos : integer range 0 to 1087 := '0';

begin

	vga1 : VGA_DRIVER port map (
		vga_clk => vga_clk,
		h_sync => HS,
		v_sync => VS,
		red => R,
		green	 => G,
		blue	 => B,
		request_frame => request_frame,
		current_h => hpos,
		current_v => vpos,
		red_in	 => set_red,
		green_in  => set_green,
		blue_in	 => set_blue
	);

end main;
