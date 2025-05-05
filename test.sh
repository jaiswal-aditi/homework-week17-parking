#!/bin/bash

echo "Running tests..."
echo

# Run program with test input, generate output file
./park < test/input.txt

# Check if file was created
if [ ! -f parking_data.txt ]; then
  echo "❌ parking_data.txt not found"
  exit 1
fi

# Normalize files (remove newlines, spaces)
normalized_output=$(tr -d '[:space:]' < parking_data.txt)
expected=$(tr -d '[:space:]' < test/expected_output.txt)

# Check program exit status
if [ $? -eq 0 ]; then
  echo "✅ Program exited successfully"
else
  echo "❌ Program did not exit cleanly"
  exit 1
fi

# Compare output
if [[ "$normalized_output" == "$expected" ]]; then
  echo "✅ Test passed"
else
  echo "❌ Test failed"
  echo "Expected: $expected"
  echo "Got     : $normalized_output"
  exit 1
fi
