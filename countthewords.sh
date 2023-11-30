#!/usr/bin/env bash

help()
{
 # Display Help
 echo ""
 echo "This script counts the words in a file and sorts them by the number 
of occurrences starting with the most frequent word."
 echo ""
 echo "Syntax: countthewords.sh  <path to a text file name>"
 echo ""
}

if [ $# -ne 1 ] 
then
	echo "Error: Incorrect number of paramateres, $#!"
	help
	exit 1
fi	

if [ ! -f $1 ] 
then 
	echo "Error: $1 is not a file or it can not be found!"
	exit 1
fi

awk 'BEGIN { FS = "[^A-Za-z]+" }
{ for(i = 1 ; i <= NF ; i++)  if ( length($i)>=1 ) words[tolower($i)]++ }
END { for ( i in words ) print i": "words[i] }' < $1 | sort -k2rn
