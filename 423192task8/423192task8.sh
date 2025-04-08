#!/bin/bash

# Step 1: Ensure GDB and required tools are installed
echo "Checking if GDB is installed..."
if ! command -v gdb &> /dev/null
then
    echo "GDB not found, installing..."
    sudo apt-get update
    sudo apt-get install gdb -y
else
    echo "GDB is already installed."
fi

# Step 2: Enable core dumps
echo "Enabling core dumps..."
ulimit -c unlimited  # Allow core dumps
echo "Core dump size is set to unlimited."

# Step 3: Set the location for core dumps (optional)
echo "Setting core dump location..."
sudo sysctl -w kernel.core_pattern=/tmp/core.%e.%p
echo "Core dumps will be stored in /tmp with the format core.%e.%p"

# Step 4: Compile the C program with debugging symbols
echo "Compiling the C program with debugging symbols..."
gcc -g -o myprogram myprogram.c

# Step 5: Run the program and intentionally cause a crash
echo "Running the program to cause a crash..."
./myprogram

# Check if the program has crashed and generated a core dump
if [ -f /tmp/core.* ]; then
    echo "Core dump detected. Proceeding with GDB analysis..."
else
    echo "No core dump found. Ensure your program crashes to generate a

