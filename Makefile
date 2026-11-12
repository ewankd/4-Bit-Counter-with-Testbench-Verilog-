SHELL := /bin/bash
.PHONY: test waves clean

test:
	@command -v iverilog >/dev/null || (echo "Missing iverilog: sudo apt install iverilog" >&2; exit 127)
	@command -v vvp >/dev/null || (echo "Missing vvp: sudo apt install iverilog" >&2; exit 127)
	mkdir -p build
	iverilog -g2012 -Wall -s tb_counter4 -o build/counter4 rtl/counter4.v tb/tb_counter4.v
	vvp build/counter4

waves:
	@command -v iverilog >/dev/null || (echo "Missing iverilog: sudo apt install iverilog" >&2; exit 127)
	@command -v vvp >/dev/null || (echo "Missing vvp: sudo apt install iverilog" >&2; exit 127)
	mkdir -p build
	iverilog -g2012 -Wall -s tb_counter4 -o build/counter4 rtl/counter4.v tb/tb_counter4.v
	vvp build/counter4 +VCD

clean:
	rm -rf build
