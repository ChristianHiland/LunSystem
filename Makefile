# Makefile for a Rust project using Kconfig

# The Kconfig tool for the menu interface
KCONFIG_MCONF ?= kconfig-mconf

# The Kconfig file
KCONFIG_FILE = Kconfig

# Default target: build the Rust project
all:
	@echo "Running Cargo build..."
	@cd LunSystems && cargo build

# Target to run the configuration menu
menuconfig:
	@$(KCONFIG_MCONF) $(KCONFIG_FILE)
	@echo "\nConfiguration saved in .config. Run 'make' or 'cargo build' to apply."

# Target to clean up Cargo and Kconfig artifacts
clean:
	@cargo clean
	@rm -f .config .config.old

.PHONY: all clean menuconfig