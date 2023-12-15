library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity kboard is
	port(
		keys: in std_logic_vector(0 to 15);
		val: out std_logic_vector(3 downto 0);
		ok: out std_logic
	);
end;

architecture structural of kboard is
begin
	val(3) <= keys(8) or keys(9) or keys(10) or keys(11) or keys(12) or keys(13) or keys(14) or keys(15);
	val(2) <= keys(4) or keys(5) or keys(6) or keys(7) or keys(12) or keys(13) or keys(14) or keys(15);
	val(1) <= keys(2) or keys(3) or keys(6) or keys(7) or keys(10) or keys(11) or keys(14) or keys(15);
	val(0) <= keys(1) or keys(3) or keys(5) or keys(7) or keys(9) or keys(11) or keys(13) or keys(15);
	ok <= keys(0) xor keys(1) xor keys(2) xor keys(3) xor keys(4) xor keys(5) xor keys(6) xor keys(7) xor
		keys(8) xor keys(9) xor keys(10) xor keys(11) xor keys(12) xor keys(13) xor keys(14) xor keys(15);
end structural;
