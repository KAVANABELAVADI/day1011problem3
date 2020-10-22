#!/bin/bash -x

declare -A singlet

read -p "Enter Number of Trails - " trails
temp=$trails

while [ $temp -gt 0 ]
do
	res=$((RANDOM % 2))
        if [ $res == 0 ]
        then
                (( heads++ ))
		singlet[heads]+=" $res"
        else
                (( tails++ ))
		singlet[tails]+=" $res"
        fi
        ((temp--))
done
echo ${singlet[heads]}
echo ${singlet[tails]}

echo "Number of heads - "$heads
echo $heads $trails | awk '{print "Persentage of heads - " ((100*$1/$2)) }'
echo "Number of tails - "$tails
echo $tails $trails | awk '{print "Persentage of tails - " ((100*$1/$2)) }'


