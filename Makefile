GHDL=ghdl
FLAGS="--std=08"

perfect:
	@$(GHDL) -a $(FLAGS) test_perfect.vhd kboard.vhd ff_d.vhd reg_4b.vhd po.vhd pc.vhd comp_1b.vhd comp_4b.vhd mux_2x1_4b.vhd demux_1x16_1b.vhd reg_1b.vhd sevseg.vhd display.vhd matchgame.vhd
	@$(GHDL) -e $(FLAGS) test_perfect
	@$(GHDL) -r $(FLAGS) test_perfect --wave=test_perfect.ghw --stop-time=1us

mistakes:
	@$(GHDL) -a $(FLAGS) test_mistakes.vhd kboard.vhd ff_d.vhd reg_4b.vhd po.vhd pc.vhd comp_1b.vhd comp_4b.vhd mux_2x1_4b.vhd demux_1x16_1b.vhd reg_1b.vhd sevseg.vhd display.vhd matchgame.vhd
	@$(GHDL) -e $(FLAGS) test_mistakes
	@$(GHDL) -r $(FLAGS) test_mistakes --wave=test_mistakes.ghw --stop-time=5us
