library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity demux_1x16_1b is
	port(
		x: in std_logic;
		sel: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(15 downto 0)
	);
end;

architecture structural of demux_1x16_1b is
begin
	s(15) <= x and sel(3) and sel(2) and sel(1) and sel(0);
	s(14) <= x and sel(3) and sel(2) and sel(1) and not sel(0);
	s(13) <= x and sel(3) and sel(2) and not sel(1) and sel(0);
	s(12) <= x and sel(3) and sel(2) and not sel(1) and not sel(0);
	s(11) <= x and sel(3) and not sel(2) and sel(1) and sel(0);
	s(10) <= x and sel(3) and not sel(2) and sel(1) and not sel(0);
	s(9) <= x and sel(3) and not sel(2) and not sel(1) and sel(0);
	s(8) <= x and sel(3) and not sel(2) and not sel(1) and not sel(0);
	s(7) <= x and not sel(3) and sel(2) and sel(1) and sel(0);
	s(6) <= x and not sel(3) and sel(2) and sel(1) and not sel(0);
	s(5) <= x and not sel(3) and sel(2) and not sel(1) and sel(0);
	s(4) <= x and not sel(3) and sel(2) and not sel(1) and not sel(0);
	s(3) <= x and not sel(3) and not sel(2) and sel(1) and sel(0);
	s(2) <= x and not sel(3) and not sel(2) and sel(1) and not sel(0);
	s(1) <= x and not sel(3) and not sel(2) and not sel(1) and sel(0);
	s(0) <= x and not sel(3) and not sel(2) and not sel(1) and not sel(0);
end structural;
