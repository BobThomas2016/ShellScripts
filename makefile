#       makefile for package shell3_2016.sh in CSC 352 UNIX
#       shell3_2016.sh must be an executable bash script that counts file
#       statistics, see README.txt for details.
#       Spring 2016, Dr. Dale Parson

all:		test

TARGET = shell3spring2016

DEBUG = 1

include ./makelib     # Get the common make definitions.

build:
			@echo Invoke make test to test your shell script.

clean:		subclean
		/bin/rm -f *.o *.dif *.out *.tmp

test:	testsmall testbig testarg0 testarg1 testbaddir

testsmall:
		./shell3_2016.sh smallTestDir text absent > smallTestDir.text.out
		diff smallTestDir.text.out smallTestDir.text.ref > smallTestDir.text.dif

testbig:
		./shell3_2016.sh /home/KUTZTOWN/parson/AdvDataStructures/ text absent '[Zz][Ii][Pp]' > AdvDataStructures.text.out
		diff AdvDataStructures.text.out AdvDataStructures.text.ref > AdvDataStructures.text.dif

testarg0:
		-bash -c './shell3_2016.sh 2> testarg0.text.tmp ; ISOK=$$? ; echo $$ISOK > testarg0.text.out'
		diff testarg0.text.out testarg0.text.ref > testarg0.text.dif

testarg1:
		-bash -c './shell3_2016.sh . 2> testarg1.text.tmp ; ISOK=$$? ; echo $$ISOK > testarg1.text.out'
		diff testarg1.text.out testarg1.text.ref > testarg1.text.dif

testbaddir:
		-bash -c './shell3_2016.sh makefile make 2> testbaddir.text.tmp ; ISOK=$$? ; echo $$ISOK > testbaddir.text.out'
		diff testbaddir.text.out testbaddir.text.ref > testbaddir.text.dif
