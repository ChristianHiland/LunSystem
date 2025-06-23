# Makefile for a Rust project using Kconfig

# The Kconfig tool for the menu interface
KCONFIG_MCONF ?= kconfig-mconf
# The Kconfig file
KCONFIG_FILE = Kconfig
# Other Vars
CURRENT_PATH := $(CURDIR)

# Default target: build the Rust project
all: 
	@mkdir -p output/libs && mkdir -p output/bins
	@echo "Running Cargo build..."
	@echo "Compiling LunSystems"
	@cd LunSystems && cargo build && cp $(CURRENT_PATH)/LunSystems/target/debug/LunSystems $(CURRENT_PATH)/output/
		

# Target to run the configuration menu
menuconfig:
	@$(KCONFIG_MCONF) $(KCONFIG_FILE)
	@echo "\nConfiguration saved in .config. Run 'make'"

# Target to clean up Cargo and Kconfig artifacts
clean:
	@cd LunSystems && cargo clean
	@rm -f .config .config.old
	@rm -rf output

.PHONY: all clean menuconfig