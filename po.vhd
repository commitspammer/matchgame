library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity po is
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
end;

architecture structural of po is

	type memory_16x4b is array(0 to 15) of std_logic_vector(3 downto 0);
	signal mem: memory_16x4b := (
		"0000","0000","0001","0001",
		"0010","0010","0011","0011",
		"0100","0100","0101","0101",
		"0110","0110","0111","0111"
	);
	signal amem, bmem: std_logic_vector(3 downto 0);
	signal mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9: std_logic_vector(3 downto 0);
	signal mem10, mem11, mem12, mem13, mem14, mem15: std_logic_vector(3 downto 0);

	component kboard is
		port(
			keys: in std_logic_vector(15 downto 0);
			val: out std_logic_vector(3 downto 0);
			ok: out std_logic
		);
	end component;
	signal val: std_logic_vector(3 downto 0);

	component reg_4b is
		port(
			clk: in std_logic;
			nrst: in std_logic;
			load: in std_logic;
			d: in std_logic_vector(3 downto 0);
			q: out std_logic_vector(3 downto 0)
		);
	end component;
	signal a, b: std_logic_vector(3 downto 0);

	component comp_4b is
		port(
			x: in std_logic_vector(3 downto 0);
			y: in std_logic_vector(3 downto 0);
			gr: out std_logic;
			eq: out std_logic;
			le: out std_logic
		);
	end component;

	component mux_2x1_4b is
		port(
			x: in std_logic_vector(3 downto 0);
			y: in std_logic_vector(3 downto 0);
			sel: in std_logic;
			s: out std_logic_vector(3 downto 0)
		);
	end component;
	signal amux, bmux, cmux: std_logic_vector(3 downto 0);

	component demux_1x16_1b is 
		port(
			x: in std_logic;
			sel: in std_logic_vector(3 downto 0);
			s: out std_logic_vector(15 downto 0)
		);
	end component;
	signal cdemux: std_logic_vector(15 downto 0);

	component reg_1b is
		port(
			clk: in std_logic;
			nrst: in std_logic;
			load: in std_logic;
			d: in std_logic;
			q: out std_logic
		);
	end component;
	signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15: std_logic;

	component display is
		port(
			leds: in std_logic_vector(15 downto 0);
			symb0, symb1, symb2, symb3, symb4, symb5, symb6, symb7, symb8,
			symb9, symb10, symb11, symb12, symb13, symb14, symb15: in std_logic_vector(3 downto 0);
			segs0, segs1, segs2, segs3, segs4, segs5, segs6, segs7, segs8,
			segs9, segs10, segs11, segs12, segs13, segs14, segs15: out std_logic_vector(6 downto 0)
		);
	end component;

begin
	kb: kboard port map(keys, val, ok => ok);
	reg_a: reg_4b port map(clk => clk, nrst => nrst, load => la and ok, d => val, q => a);
	reg_b: reg_4b port map(clk => clk, nrst => nrst, load => lb and ok, d => val, q => b);
	cmp: comp_4b port map(x => amux, y => bmux, eq => eq);
	mux_a: mux_2x1_4b port map(x => a, y => amem, sel => m1, s => amux);
	mux_b: mux_2x1_4b port map(x => b, y => bmem, sel => m1, s => bmux);
	mux_c: mux_2x1_4b port map(x => a, y => b, sel => m2, s => cmux);
	demux_c: demux_1x16_1b port map(x => lc, sel => cmux, s => cdemux);
	reg_0: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(0), d => cbit, q => q0);
	reg_1: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(1), d => cbit, q => q1);
	reg_2: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(2), d => cbit, q => q2);
	reg_3: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(3), d => cbit, q => q3);
	reg_4: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(4), d => cbit, q => q4);
	reg_5: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(5), d => cbit, q => q5);
	reg_6: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(6), d => cbit, q => q6);
	reg_7: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(7), d => cbit, q => q7);
	reg_8: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(8), d => cbit, q => q8);
	reg_9: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(9), d => cbit, q => q9);
	reg_10: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(10), d => cbit, q => q10);
	reg_11: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(11), d => cbit, q => q11);
	reg_12: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(12), d => cbit, q => q12);
	reg_13: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(13), d => cbit, q => q13);
	reg_14: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(14), d => cbit, q => q14);
	reg_15: reg_1b port map(clk => clk, nrst => nrst, load => cdemux(15), d => cbit, q => q15);
	dp: display port map(
		leds(15) => q0, leds(14) => q1, leds(13) => q2, leds(12) => q3, leds(11) => q4, leds(10) => q5,
		leds(9) => q6, leds(8) => q7, leds(7) => q8, leds(6) => q9, leds(5) => q10, leds(4) => q11,
		leds(3) => q12, leds(2) => q13, leds(1) => q14, leds(0) => q15,
		symb0 => mem0, symb1 => mem1, symb2 => mem2, symb3 => mem3, symb4 => mem4, symb5 => mem5,
		symb6 => mem6, symb7 => mem7, symb8 => mem8, symb9 => mem9, symb10 => mem10, symb11 => mem11,
		symb12 => mem12, symb13 => mem13, symb14 => mem14, symb15 => mem15,
		segs0 => s0, segs1 => s1, segs2 => s2, segs3 => s3, segs4 => s4, segs5 => s5,
		segs6 => s6, segs7 => s7, segs8 => s8, segs9 => s9, segs10 => s10, segs11 => s11,
		segs12 => s12, segs13 => s13, segs14 => s14, segs15 => s15
	);

	amem <= mem(to_integer(unsigned(a)));
	bmem <= mem(to_integer(unsigned(b)));
	mem0 <= mem(0); mem1 <= mem(1); mem2 <= mem(2); mem3 <= mem(3); mem4 <= mem(4); mem5 <= mem(5);
	mem6 <= mem(6); mem7 <= mem(7); mem8 <= mem(8); mem9 <= mem(9); mem10 <= mem(10); mem11 <= mem(11);
	mem12 <= mem(12); mem13 <= mem(13); mem14 <= mem(14); mem15 <= mem(15);
end structural;
