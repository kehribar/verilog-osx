#------------------------------------------------------------------------------
# Simple makefile to simulate Verilog HDL designs under OSX.
# Modify the variables below to suit your own files.
#------------------------------------------------------------------------------
# <ihsan@kehribar.me> - 2016
#------------------------------------------------------------------------------
TESTBENCH = top_tb
SRCS	  = top.v up_counter.v clken_gen.v


#------------------------------------------------------------------------------
# You should't be changing what is below
#------------------------------------------------------------------------------
all: simulate

lint:
	verilator --lint-only $(SRCS)

simulate:
	iverilog -o $(TESTBENCH).vvp $(SRCS) $(TESTBENCH).v
	vvp $(TESTBENCH).vvp > $(TESTBENCH)_log.txt

gtkwave: simulate
	gtkwave $(TESTBENCH).vcd

scansion: simulate
	open /Applications/Scansion.app $(TESTBENCH).vcd

clean:
	rm -rf $(TESTBENCH).vvp $(TESTBENCH).vcd $(TESTBENCH)_log.txt
