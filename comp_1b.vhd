library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comp_1b is
	port(
		x: in std_logic;
		y: in std_logic;
		igr: in std_logic;
		ieq: in std_logic;
		ile: in std_logic;
		ogr: out std_logic;
		oeq: out std_logic;
		ole: out std_logic
	);
end;

architecture structural of comp_1b is
begin
	ogr <= ((x and not y) and ieq) or igr;
	oeq <= (x xnor y) and ieq;
	ole <= ((not x and y) and ieq) or ile;
end structural;
