# Makefile for RISC-V Assembly Exercises

#make sure you have spike already added to bash
#if not run this command:
#"export PATH=$PATH:/opt/riscv/bin"


# Compiler and emulator
AS = riscv64-unknown-elf-as
LD = riscv64-unknown-elf-ld
SPIKE = spike
 
# Default target
all: $(PROG)
# Rule to assemble and link
$(PROG): $(PROG).s
$(AS) -o $(PROG).o $
$(LD) -T linker.ld -o $@ $(PROG).o
# Rule to run with Spike
run: $(PROG)
$(SPIKE) $(PROG)
# Rule to debug with Spike
debug: $(PROG)
$(SPIKE) -d –log-commits $(PROG)
# Clean up
clean:
rm -f *.o $(PROG)
.PHONY: all run debug clean