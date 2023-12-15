library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_1b is
	port(
		clk: in std_logic;
		nrst: in std_logic;
		load: in std_logic;
		d: in std_logic;
		q: out std_logic
	);
end;

architecture structural of reg_1b is

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
	ff0: ff_d port map(clk => clk, ena => load, nrst => nrst, d => d, q => q);
end structural;

--architecture behavioral of reg_1b is
--begin
--	process(clk) begin
--		if (rising_edge(clk)) then
--			if (load = '1') then
--				output <= input;
--			end if;
--		end if;
--	end process;
--end behavioral;
