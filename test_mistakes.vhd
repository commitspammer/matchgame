library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_mistakes is
end;

architecture sim of test_mistakes is

	constant clock_frequency: integer := 100e6;
	constant clock_period: time := 1 sec / clock_frequency;
	signal clk: std_logic := '0';

	component matchgame is
		port(
			clk: in std_logic;
			--nrst: in std_logic;
			keys: in std_logic_vector(15 downto 0);
			s0, s1, s2, s3, s4, s5, s6, s7, s8,
			s9, s10, s11, s12, s13, s14, s15: out std_logic_vector(6 downto 0)
		);
	end component;

	--signal nrst: std_logic;
	signal keys: std_logic_vector(15 downto 0);
	signal s0, s1, s2, s3, s4, s5, s6, s7, s8,
		s9, s10, s11, s12, s13, s14, s15: std_logic_vector(6 downto 0);

begin
	clk <= not clk after clock_period / 2;

	dut: matchgame port map(
		clk, keys, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15
	);

	process
		variable a: std_logic_vector(15 downto 0) := "1000000000000000";
		variable b: std_logic_vector(15 downto 0) := "0000000000000001";
	begin
		for i in 0 to 15 loop
			keys <= "0000000000000000";
			wait for 72 ns;
			keys <= a;
			a := std_logic_vector(shift_right(unsigned(a), 1));
			wait for 18 ns;
			keys <= "0000000000000000";
			wait for 72 ns;
			keys <= b;
			b := std_logic_vector(shift_left(unsigned(b), 1));
			wait for 18 ns;
		end loop;
		wait for 5 us; -- until end of sim
	end process;
end sim;
