# The name of the Kconfig file
KCONFIG_CONFIG ?= .config
export KCONFIG_CONFIG

# The path to the kconfig-frontends tools
KCONFIG_FRONTENDS_PATH ?= /usr/bin

# The main configuration file
KCONFIG_FILE = Kconfig

# Output directory for generated files
AUTOCONF_H = include/autoconf.h

# Targets for the configuration menu
menuconfig:
	$(KCONFIG_FRONTENDS_PATH)/kconfig-mconf $(KCONFIG_FILE)

# Include the generated configuration
-include $(KCONFIG_CONFIG)
# Your application's source files
SRCS = main.c
# The final executable name
TARGET = LunSystems
# Compiler and flags
CC = gcc
CFLAGS = -Iinclude

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^

# Generate the C header file from the .config
$(AUTOCONF_H): $(KCONFIG_CONFIG)
	$(KCONFIG_FRONTENDS_PATH)/kconfig-conf --sync-dependencies --olddefconfig $(KCONFIG_FILE)
	$(KCONFIG_FRONTENDS_PATH)/kconfig-conf --write-config /dev/null --write-autoconf $@ $(KCONFIG_FILE)

# Clean up generated files
clean:
	rm -f $(TARGET) $(KCONFIG_CONFIG) $(AUTOCONF_H)

.PHONY: all clean menuconfig