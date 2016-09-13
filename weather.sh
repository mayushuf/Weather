#!/bin/bash
x=$1
echo The value of x is $x
if [ $x -le 50 ]
then
   echo "It is cold"
elif [ $x -ge 51 ] && [ $x -le 80 ]
then
   echo "Ah, nice day"
else
   echo "Too hot!"
fi

