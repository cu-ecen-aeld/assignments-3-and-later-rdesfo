#!/usr/bin/bash

if [ "$1" == "" ]; then
  echo "missing file path";
  exit 1;
else
  writefile=$1
fi

if [ "$2" == "" ]; then
  echo "missing write string";
  exit 1;
else
  writestr=$2
fi

writeflepath=$(dirname $writefile)

if [[ -d $writeflepath ]]; then
  ( echo "$writestr" > $writefile ) || ( echo "unablable to write to file" && exit 1 )
else
  mkdir -p $writeflepath
  ( echo "$writestr" > $writefile ) || ( echo "unablable to write to file" && exit 1 )
fi
