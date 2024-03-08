#!/usr/bin/bash

if [ "$1" == "" ]; then
  echo "missing files directory";
  exit 1;
else
  filesdir=$1
fi

if [ "$2" == "" ]; then
  echo "missing search string";
  exit 1;
else
  searchstr=$2
fi

if [[ ! -d $filesdir ]]; then
  echo "$filesdir does not exist";
  exit 1;
fi

x=$(grep -l -r $searchstr $filesdir | wc -l)
y=$(grep -r $searchstr $filesdir | wc -l)

echo "The number of files are $x and the number of matching lines are $y"
