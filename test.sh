#!/bin/bash

# Clean old files
make clean

# Compile the program
make

# Run the program with simulated input
./parking <<EOF
1
ABC123
John
Doe
A12345678
09:30
5
EOF

# Check if file content matches expected output exactly
if cmp -s parking_data.txt expected_parking_data.txt; then
    echo "✅ Test Passed"
    exit 0
else
    echo "❌ Test Failed"
    echo "Expected:"
    cat expected_parking_data.txt
    echo "Got:"
    cat parking_data.txt
    exit 1
fi
