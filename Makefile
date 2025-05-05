# Compiler
# Makefile

CC = g++
TARGET = park

all: $(TARGET)

$(TARGET): parking.cpp
	$(CC) parking.cpp -o $(TARGET)

clean:
	rm -f $(TARGET) parking_data.txt test/actual_output.txt

test: $(TARGET)
	bash test.sh


