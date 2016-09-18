#!/bin/bash
echo "Enter 1: for Yesterday or 2: for any previous day"
read dt

if [ $dt -eq 1 ]
then
	day=`date -d yesterday +%d`
	month=`date -d yesterday +%m`
	year=`date -d yesterday +%Y`	 
else
	echo "Enter your day month and year"
	echo "Day and press Enter"
	read day
	echo "Month and press Enter"
	read month
	echo "Year in 4 digit and press Enter"
	read year

	year2=$(( $year % 4 ))

        if [ $year2 -ne 0 ] && [ $day -eq 29 ] && [ $month -eq 2 ]
	then
	    echo "$y is not a Leap Year!, the date does not exist"
	    echo "run the process again"
	    exit 1
		
	fi
fi

x=`curl -s "https://www.wunderground.com/history/airport/GNV/$year/$month/$day/DailyHistory.heml?&format=1"| \
	cat |grep -E "\w+M\,"|awk '{print $2}'| awk -F',' '{print $2}'|sort -nr| head -n1 | \
	awk '{$0=int($0)}1'`

echo Maximum temperature on the  day was about $x degrees Fahrenheit

if [ $x -le 50 ]
then
   echo "It was cold"

elif [ $x -ge 51 ] && [ $x -le 80 ]
then
   echo "Ah, It was a nice day"

else
   echo "It was too hot!"
fi

