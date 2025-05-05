# Compiler
# Makefile

all: university

university: university.cpp
	g++ -o university university.cpp

test: university
	bash test.sh

clean:
	rm -f university


