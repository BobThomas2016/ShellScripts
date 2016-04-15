# shell3_2016.sh -- D. Parson solution to assignment 3, CSC 352 Unix
#   Spring 2016. This program accepts a path to a DIRECTORY as its first
#   command line argument, followed by one or more string PATTERNs
#   as the remaining command line arguments.
#
#   It must verify that it has at least 2 initial command line arguments
#   (the DIRECTORY and at least one PATTERN), and that the DIRECTORY is
#   in fact a directory. If any of these conditions fails, report an error
#   TO STANDARD ERROR and exits the script with an exit status of 1.
#   Otherwise proceed:
#
#   For each string pattern, it calls a shell function search() which
#   you must write, that does the following:

#   search() -- accept the DIRECTORY and current PATTERN as function arguments.
#       You can pass any additional arguments that you decide are necessary.
#       Find all of the *regular files* within and below the DIRECTORY
#       For each of those regular files
#           Run the file command and egrep for the pattern.
#           If the output from the file command satisfies the
#           egrep pattern, then:
#               Add 1 to a counter for the number of file types matching PATTERN.
#               Accumulate the number of lines in the file itself
#                   in a variable. Do NOT accumulate the number of lines
#                   written by the file command, which is always 1.
#                   Accumulate the number of lines in the file.
#               Accumulate the number of words in the file itself in a
#                   different variable.
#               Accumulate the number of characters in the file itself in a
#                   third variable.
#       The search() function returns these four counters to the main
#           shell code that calls the function.
#       The main code must print the results in a format in the
#       EXACT format of my .ref reference files, with NO EXTRA OR
#       MISSING CHARACTERS. You will lose a minimum of 10 points for any
#       formatting diffs, because these defeat the ability to run automated
#       tests. The EXACT format of your output statement lines must be:
#
#       PATTERN NF files, NL lines, NW words, NC chars
#
#       Do not print the leading "#       " above; PATTERN is the
#       actual pattern being checked; NF is the integer number of files
#       matching the pattern; NL is the integer numbers of lines,
#       NW is the number of words, and NC is the number of characters,
#       each separated by exact one space, with no trailing spaces.
#       Consult my reference file AdvDataStructures.ref to see the format.
#       My "make test" runs your shell script against ~parson/AdvDataStructures
#       for automated testing. It also does some test runs for error conditions.
#
#       Here are 2 examples of using the file and egrep command together:
#
#       file * | egrep directory > /dev/null ; echo $?
#           0
#   
#       file * | egrep hamburger > /dev/null ; echo $?
#           1       
#
#       In the first example, the output from the file command did
#       contain one or more lines with the PATTERN "directory", so
#       egrep succeeded with an exit status of 0; the egrep command above
#       discards the actual lines of text because we don't need those.
#       In the second example, the pattern did not match, hence the
#       egrep exit status that is non-0. Note that you will be checking
#       only *regular files* under DIRECTORY found using the find command,
#       not "file *".
#
#       You can use last year's shell3.sh in ~parson/unix/shell3.solution.zip
#       as a temp[late for writing your search() function.
#
#       This assignment is due via "make turnitin" by end of April 16.
#
#       After reporting one PATTERN's results, the main code loops to the next
#       PATTERN (if any) and calls search() again, until it has run through
#       all PATTERNs on its command line. It then terminates with an exit
#       status of 0.
#
#       NOTE: In addition to using && and || to connect tests in a shell
#       script, you can use ! with the [ ] brackets to invert the test.
#       Examples:
#
#       [ -f .. ] ; echo $?
#           1
#       [ ! -f .. ] ; echo $?
#           0
