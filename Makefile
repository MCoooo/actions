# Variables
CC = gcc
CFLAGS = -Wall -g
TARGET_DIR = target
SOURCES = src/main.c
OBJECTS = $(SOURCES:src/%.c=$(TARGET_DIR)/%.o)
EXECUTABLE = $(TARGET_DIR)/duck

# Default target
all: $(EXECUTABLE)

# Rule to create the target directory
$(TARGET_DIR):
	mkdir -p $(TARGET_DIR)

# Rule to build the executable
$(EXECUTABLE): $(TARGET_DIR) $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $(OBJECTS)

# Rule to build object files
$(TARGET_DIR)/%.o: src/%.c | $(TARGET_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(TARGET_DIR)/*.o $(EXECUTABLE)

.PHONY: all clean

