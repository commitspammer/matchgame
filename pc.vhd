library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc is
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
end;

architecture behavioral of pc is

	type State_t is (Clear, ReadA, ShowA, ReadB, Validate, ShowB, Compare, HideA, HideB);
	signal state: State_t;
	signal nextstate: State_t;

begin
	process(clk) begin
		if (rising_edge(clk)) then
			state <= nextstate;
		end if;
	end process;

	process(state, ok, eq) begin
		case state is
		when Clear =>
			nextstate <= ReadA;
		when ReadA =>
			if (ok = '1') then
				nextstate <= ShowA;
			else
				nextstate <= ReadA;
			end if;
		when ShowA =>
			nextstate <= ReadB;
		when ReadB =>
			if (ok = '1') then
				nextstate <= Validate;
			else
				nextstate <= ReadB;
			end if;
		when Validate =>
			if (eq = '1') then
				nextstate <= ReadB;
			else
				nextstate <= ShowB;
			end if;
		when ShowB =>
			nextstate <= Compare;
		when Compare =>
			if (eq = '1') then
				nextstate <= ReadA;
			else
				nextstate <= HideA;
			end if;
		when HideA =>
			nextstate <= HideB;
		when HideB =>
			nextstate <= ReadA;
		when others =>
			nextstate <= ReadA;
		end case;
	end process;

	nrst <= '0' when (state = Clear) else '1';
	la <= '1' when (state = ReadA) else '0';
	lb <= '1' when (state = ReadB) else '0';
	m1 <= '1' when (state = Compare) else '0';
	m2 <= '1' when (state = ShowB or state = HideB) else '0';
	lc <= '1' when (state = ShowA or state = ShowB or state = HideA or state = HideB) else '0';
	cbit <= '1' when (state = ShowA or state = ShowB) else '0';
end behavioral;
