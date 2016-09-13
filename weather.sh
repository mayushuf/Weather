#!/bin/bash
echo "Day and press Enter"
read day
echo "Month and press Enter"
read month
echo "Year in 4 digit and press Enter"
read year
x=`curl "https://www.wunderground.com/history/airport/GNV/$year/$month/$day/DailyHistory.heml?&format=1"| \
	cat |grep -E "\w+M\,"|awk '{print $2}'| awk -F',' '{print $2}'|sort -nr| head -n1 | \
	awk '{$0=int($0)}1'`
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

