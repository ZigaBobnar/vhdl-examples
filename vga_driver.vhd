library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_DRIVER is
	port(vga_clk : std_logic;
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

end entity VGA_DRIVER;

architecture main of VGA_DRIVER is
-- Implementation of 1680x1050_60Hz
signal h_pos : integer range 0 to 2256 := 0; -- FP + SYNC + BP + X
signal v_pos : integer range 0 to 1087 := 0; -- FP + SYNC + BP + Y

begin
	current_h <= h_pos;
	current_v <= v_pos;

	vga_timing : process(vga_clk)
	begin
		if (rising_edge(vga_clk)) then
			if (h_pos < 2256) then
				request_frame <= '0';
				h_pos <= h_pos + 1;
			else
				h_pos <= 0;
				
				if (v_pos < 1087) then
					v_pos <= v_pos + 1;
				else
					v_pos <= 0;
					request_frame <= '1';
				end if;
			end if;
			
			if (h_pos > 103 and h_pos < 288) then
				h_sync <= '0';
			else
				h_sync <= '1';
			end if;
			
			if (v_pos > 0 and v_pos < 4) then
				v_sync <= '1';
			else
				v_sync <= '0';
			end if;
			
			if ((h_pos >= 0 and h_pos < 576) or (v_pos >= 0 and v_pos < 37)) then
				red <= (others => '0');
				green <= (others => '0');
				blue <= (others => '0');
			else
				if ((h_pos >= 576 and h_pos < 586) or
						(v_pos >= 37 and v_pos < 47) or
						(h_pos >= 2246 and h_pos < 2256 ) or
						(v_pos >= 1077 and v_pos < 1087 )) then
					red <= (others => '1');
					green <= (others => '1');
					blue <= (others => '1');
				else
					red <= red_in;
					green <= green_in;
					blue <= blue_in;
				end if;
			end if;
		end if;
	end process;
end main;