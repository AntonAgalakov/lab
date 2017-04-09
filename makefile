.PHONY:	all test clean
	
all : calc

calc:	build/src/lab1.o build/src/deposit.o
	gcc build/src/lab1.o build/src/deposit.o -o bin/deposit-calc

build/src/deposit.o:	src/deposit.c
	gcc -Wall -Werror -c src/deposit.c -o build/src/deposit.o

build/src/lab1.o:	src/lab1.c
	gcc -Wall -Werror -c src/lab1.c -o build/src/lab1.o
test: deposit-test

deposit-test: build/test/lab1.o build/test/deposit_test.o /build/src/deposit.o
	gcc build/test/lab1.o build/test/deposit_test.o build/src/deposit.o -o bin/deposit-test

build/test/lab1.o: test/lab1.c
	gcc -I thirdparty src -Wall -Werror -c test/lab1.c -o build/test/lab1.o

build/test/deposit_test.o: test/deposit_test.c
	gcc -I thirdparty src -Wall -Werror -c test/deposit_test.c -o build/test/deposit_test.o
clean:
	rm -rf build/test/*.o build/src/*.o bin/*
