library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sevseg is
	port(
		off: in std_logic;
		val: in std_logic_vector(3 downto 0);
		segs: out std_logic_vector(6 downto 0)
		-- segs 6 downto 0:
		--    66666
		--    5...4
		--    5...4
		--    33333
		--    2...1
		--    2...1
		--    00000
	);
end;

architecture dataflow of sevseg is
begin
	segs(6) <= '0' when off = '1' else '0' when val="0001" or val="0100" else '1';
	segs(5) <= '0' when off = '1' else '0' when val="0001" or val="0010" or val="0011" or val="0111" else '1';
	segs(4) <= '0' when off = '1' else '0' when val="0101" or val="0110" else '1';
	segs(3) <= '0' when off = '1' else '0' when val="0001" or val="0111" or val="0000" else '1';
	segs(2) <= '0' when off = '1' else '1' when val="0010" or val="0110" or val="1000" or val="0000" else '0';
	segs(1) <= '0' when off = '1' else '0' when val="0010" else '1';
	segs(0) <= '0' when off = '1' else '0' when val="0001" or val="0100" or val="0111" else '1';
end dataflow;
