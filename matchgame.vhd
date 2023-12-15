library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity matchgame is
	port(
		clk: in std_logic;
		--nrst: in std_logic;
		keys: in std_logic_vector(15 downto 0);
		s0, s1, s2, s3, s4, s5, s6, s7, s8,
		s9, s10, s11, s12, s13, s14, s15: out std_logic_vector(6 downto 0)
	);
end;

architecture structural of matchgame is

	component po is
		port(
			clk: in std_logic;
			nrst: in std_logic;
			keys: in std_logic_vector(15 downto 0);
			la: in std_logic;
			lb: in std_logic;
			m1: in std_logic;
			m2: in std_logic;
			cbit: in std_logic;
			lc: in std_logic;
			eq: out std_logic;
			ok: out std_logic;
			s0, s1, s2, s3, s4, s5, s6, s7, s8,
			s9, s10, s11, s12, s13, s14, s15: out std_logic_vector(6 downto 0)
		);
	end component;
	signal la: std_logic;
	signal lb: std_logic;
	signal m1: std_logic;
	signal m2: std_logic;
	signal cbit: std_logic;
	signal lc: std_logic;

	component pc is
		port(
			clk: in std_logic;
			nrst: out std_logic;
			eq: in std_logic;
			ok: in std_logic;
			la: out std_logic;
			lb: out std_logic;
			m1: out std_logic;
			m2: out std_logic;
			cbit: out std_logic;
			lc: out std_logic
		);
	end component;
	signal ok: std_logic;
	signal eq: std_logic;
	signal nrst: std_logic;

begin
	po0: po port map(clk, nrst, keys, la, lb, m1, m2, cbit, lc, eq, ok,
		s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15);
	pc0: pc port map(clk, nrst, eq, ok, la, lb, m1, m2, cbit, lc);
end structural;
