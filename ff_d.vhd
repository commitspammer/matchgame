library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- note: behavioral and dataflow are equivalent, but structural just breaks
entity ff_d is
	port(
		clk: in std_logic;
		nrst: in std_logic;
		ena: in std_logic;
		d: in std_logic;
		q: inout std_logic;
		nq: inout std_logic
	);
end;

--architecture behavioral of ff_d is
--begin
--	process(clk, nrst) begin
--		if (nrst = '0') then
--			q <= '0';
--			nq <= '1';
--		elsif (rising_edge(clk)) then
--			if (ena = '1') then
--				q <= d;
--				nq <= not d;
--			end if;
--		end if;
--	end process;
--end behavioral;

--architecture structural of ff_d is
--
----	signal a: std_logic;
----	signal b: std_logic;
--
--begin
--	process(clk, nrst) begin
--		if (nrst = '0') then
--			q <= '0';
--			nq <= '1';
--		elsif (rising_edge(clk)) then
--			if (ena = '1') then
--			--	a <= d nand clk;
--			--	b <= (not d) nand clk;
--			--	q <= a nand nq;
--			--	nq <= b nand q;
--				nq <= ((not d) nand clk) nand q;
--				q <= (d nand clk) nand nq;
--			end if;
--		end if;
--	end process;
--end structural;

architecture dataflow of ff_d is
begin
	q <= '0' when nrst = '0' else d when rising_edge(clk) and ena = '1' else q;
	nq <= '1' when nrst = '0' else not d when rising_edge(clk) and ena = '1' else nq;
end dataflow;
