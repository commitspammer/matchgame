library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity display is
	port(
		leds: in std_logic_vector(15 downto 0);
		symb0: in std_logic_vector(3 downto 0);
		symb1: in std_logic_vector(3 downto 0);
		symb2: in std_logic_vector(3 downto 0);
		symb3: in std_logic_vector(3 downto 0);
		symb4: in std_logic_vector(3 downto 0);
		symb5: in std_logic_vector(3 downto 0);
		symb6: in std_logic_vector(3 downto 0);
		symb7: in std_logic_vector(3 downto 0);
		symb8: in std_logic_vector(3 downto 0);
		symb9: in std_logic_vector(3 downto 0);
		symb10: in std_logic_vector(3 downto 0);
		symb11: in std_logic_vector(3 downto 0);
		symb12: in std_logic_vector(3 downto 0);
		symb13: in std_logic_vector(3 downto 0);
		symb14: in std_logic_vector(3 downto 0);
		symb15: in std_logic_vector(3 downto 0);
		segs0: out std_logic_vector(6 downto 0);
		segs1: out std_logic_vector(6 downto 0);
		segs2: out std_logic_vector(6 downto 0);
		segs3: out std_logic_vector(6 downto 0);
		segs4: out std_logic_vector(6 downto 0);
		segs5: out std_logic_vector(6 downto 0);
		segs6: out std_logic_vector(6 downto 0);
		segs7: out std_logic_vector(6 downto 0);
		segs8: out std_logic_vector(6 downto 0);
		segs9: out std_logic_vector(6 downto 0);
		segs10: out std_logic_vector(6 downto 0);
		segs11: out std_logic_vector(6 downto 0);
		segs12: out std_logic_vector(6 downto 0);
		segs13: out std_logic_vector(6 downto 0);
		segs14: out std_logic_vector(6 downto 0);
		segs15: out std_logic_vector(6 downto 0)
	);
end;

architecture structural of display is

	component sevseg is
		port(
			off: in std_logic;
			val: in std_logic_vector(3 downto 0);
			segs: out std_logic_vector(6 downto 0)
		);
	end component;

begin
	ss0: sevseg port map(off => not leds(15), val => symb0,  segs => segs0);
	ss1: sevseg port map(off => not leds(14), val => symb1,  segs => segs1);
	ss2: sevseg port map(off => not leds(13), val => symb2,  segs => segs2);
	ss3: sevseg port map(off => not leds(12), val => symb3,  segs => segs3);
	ss4: sevseg port map(off => not leds(11), val => symb4,  segs => segs4);
	ss5: sevseg port map(off => not leds(10), val => symb5,  segs => segs5);
	ss6: sevseg port map(off => not leds(9),  val => symb6,  segs => segs6);
	ss7: sevseg port map(off => not leds(8),  val => symb7,  segs => segs7);
	ss8: sevseg port map(off => not leds(7),  val => symb8,  segs => segs8);
	ss9: sevseg port map(off => not leds(6),  val => symb9,  segs => segs9);
	ss10: sevseg port map(off => not leds(5), val => symb10, segs => segs10);
	ss11: sevseg port map(off => not leds(4), val => symb11, segs => segs11);
	ss12: sevseg port map(off => not leds(3), val => symb12, segs => segs12);
	ss13: sevseg port map(off => not leds(2), val => symb13, segs => segs13);
	ss14: sevseg port map(off => not leds(1), val => symb14, segs => segs14);
	ss15: sevseg port map(off => not leds(0), val => symb15, segs => segs15);
end structural;
