#!/bin/bash

# Erik Palmer
# 2-5-2017
# Borrowed heavily from http://stackoverflow.com/questions/3846123/generating-permutations-using-bash


# This function recursively determines all the permutations
# of a list of indices. Then it uses this list to output
# permutations of the array, using ";" as the EOL character.

perm() {
  item="$1"
  out="$2"

  if [[ "$item" == "" ]]; then
          for (( i=0; i<${#out}; i++ )); 
          do
             echo ${ITEMS[${out:i:1}]}     
          done           
          echo ";"
    return
  fi 

  for (( i=0; i<${#item}; i++ )) ; 
    do
    ( perm "${item:0:i}${item:i+1}" "$out${item:i:1}" "$i" )
    done
  }

# This is list of things to permutate

ITEMS=("AWESOME" "BORING" "COOL" "YACK" )


# 0123 are the indices to permutate, if 3 items -> 012 

var="$(perm 0123)"


# Read all the output permutations into separate array
# elements. 

OIFS=$IFS
IFS=";"
for x in $var
do
        LIST[$COUNTER]=$x
        COUNTER=$COUNTER+1
done
IFS=$OIFS

# Ouput the reslts
for (( i=0; i<${#LIST[@]}; i++ )) 
do
        echo ${LIST[$i]}
done

