#!/bin/bash
#	Author:  Bob Thomas
#	Creation Date: 4/5/2016
#	Due Date:  4/16/2016
#	Course:  CSC352
#	Professor:  Dr. Parson
#	Assignment:  #3
#	File name:  shell3_2016.sh 
#	Purpose: This program accepts a path to a DIRECTORY as its first
#  		command line argument, followed by one or more string PATTERNs
#  		as the remaining command line arguments.
if [ "$DEBUG_SHELL3" != "" ] && [ "$DEBUG_SHELL3" -ne 0 ]
then
    set -x
fi
function search(){
	finddirectory=`find $directory`
	filecount=`file $finddirectory | egrep -i $value | wc -l`
	if [ $filecount -gt 0 ]
	then
		for f in `file $finddirectory | egrep -i $value | cut -d':' -f1`
		do
			linecnt=`cat $f | wc -l`
			linecount=`expr $linecount + $linecnt` 
			wordcnt=`cat $f | wc -w`
			wordcount=`expr $wordcount + $wordcnt`
			charactercnt=`cat $f | wc -c`
			charactercount=`expr $charactercount + $charactercnt`
		done
	fi
	eval "$2=$filecount"
	eval "$3=$wordcount"
	eval "$4=$charactercount"
	eval "$5=$linecount"

}

directory=$1
if [ $# -lt 2 ] || [ ! -d "$1" ] 
then
echo "Error">&2
exit 1
else
	while [ $# -gt 1 ]
	do
		filecount=0
		wordcount=0
		charactercount=0
		linecount=0
		value=$2
		search value filecount wordcount charactercount linecount
		if [ $filecount -ge 0 ]
		then
			echo -e "$value $filecount files, $linecount lines, $wordcount words, $charactercount chars"
		fi
		shift
	done
fi 