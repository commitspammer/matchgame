library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_2x1_4b is
	port(
		x: in std_logic_vector(3 downto 0);
		y: in std_logic_vector(3 downto 0);
		sel: in std_logic;
		s: out std_logic_vector(3 downto 0)
	);
end;

architecture structural of mux_2x1_4b is
begin
	s(3) <= (x(3) and not sel) or (y(3) and sel);
	s(2) <= (x(2) and not sel) or (y(2) and sel);
	s(1) <= (x(1) and not sel) or (y(1) and sel);
	s(0) <= (x(0) and not sel) or (y(0) and sel);
end structural;
