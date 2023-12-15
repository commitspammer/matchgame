library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_4b is
	port(
		clk: in std_logic;
		nrst: in std_logic;
		load: in std_logic;
		d: in std_logic_vector(3 downto 0);
		q: out std_logic_vector(3 downto 0)
	);
end;

architecture structural of reg_4b is

	component ff_d is
		port(
			clk: in std_logic;
			nrst: in std_logic;
			ena: in std_logic;
			d: in std_logic;
			q: inout std_logic;
			nq: inout std_logic
		);
	end component;

begin
	ff0: ff_d port map(clk => clk, ena => load, nrst => nrst, d => d(0), q => q(0));
	ff1: ff_d port map(clk => clk, ena => load, nrst => nrst, d => d(1), q => q(1));
	ff2: ff_d port map(clk => clk, ena => load, nrst => nrst, d => d(2), q => q(2));
	ff3: ff_d port map(clk => clk, ena => load, nrst => nrst, d => d(3), q => q(3));
end structural;

--architecture behavioral of reg_4b is
--begin
--	process(clk) begin
--		if (rising_edge(clk)) then
--			if (load = '1') then
--				output <= input;
--			end if;
--		end if;
--	end process;
--end behavioral;
