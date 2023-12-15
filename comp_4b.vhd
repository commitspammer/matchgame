library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comp_4b is
	port(
		x: in std_logic_vector(3 downto 0);
		y: in std_logic_vector(3 downto 0);
		gr: out std_logic;
		eq: out std_logic;
		le: out std_logic
	);
end;

architecture structural of comp_4b is

	component comp_1b is
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
	end component;

	signal gr3, gr2, gr1: std_logic;
	signal eq3, eq2, eq1: std_logic;
	signal le3, le2, le1: std_logic;

begin
	c3: comp_1b port map(x => x(3), y => y(3),
		igr => '0', ieq => '1', ile => '0',
		ogr => gr3, oeq => eq3, ole => le3);
	c2: comp_1b port map(x => x(2), y => y(2),
		igr => gr3, ieq => eq3, ile => le3,
		ogr => gr2, oeq => eq2, ole => le2);
	c1: comp_1b port map(x => x(1), y => y(1),
		igr => gr2, ieq => eq2, ile => le2,
		ogr => gr1, oeq => eq1, ole => le1);
	c0: comp_1b port map(x => x(0), y => y(0),
		igr => gr1, ieq => eq1, ile => le1,
		ogr => gr, oeq => eq, ole => le);
end structural;
