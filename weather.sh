#!/bin/bash
x=`curl "https://www.wunderground.com/history/airport/GNV/2016/09/06/DailyHistory.heml?&format=1"| cat |grep -E "\w+M\,"|awk '{print $2}'| awk -F',' '{print $2}'|sort -nr| head -n1 | awk '{$0=int($0)}1'`
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

