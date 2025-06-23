# Makefile for a Rust project using Kconfig

# The Kconfig tool for the menu interface
KCONFIG_MCONF ?= kconfig-mconf
# The Kconfig file
KCONFIG_FILE = Kconfig
# Other Vars
CURRENT_PATH := $(CURDIR)

# Default target: build the Rust project
all: 
	@mkdir -p output/lib && mkdir -p output/bin
	@echo "Running Cargo build..."
	@echo "Compiling LunSystems"
	@cd LunSystems && cargo build && cp $(CURRENT_PATH)/LunSystems/target/debug/LunSystems $(CURRENT_PATH)/output/bin/
	@cd Howling && cargo build && cp $(CURRENT_PATH)/Howling/target/debug/libHowling.* $(CURRENT_PATH)/output/lib/
	@cd HowlingBin/Howling && cargo build && cp $(CURRENT_PATH)/HowlingBin/Howling/target/debug/Howling $(CURRENT_PATH)/output/bin/
	@cd LunTool && cargo build && cp $(CURRENT_PATH)/LunTool/target/debug/libLunTool.* $(CURRENT_PATH)/output/lib/


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