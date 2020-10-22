#!/bin/bash

declare -A singlet
declare -A doublet

doubletHead=0;
doubletHeadTail=0;
doubletTailHead=0;
doubletTail=0;

read -p "Enter Number of Trails - " trails
temp=$trails


while [ $temp -gt 0 ]
do
	#singlet
	res=$((RANDOM % 2))

	#Doublet
	res1=$res$((RANDOM%2))
	case $res1 in
		00) ((doubletHead++))
		  	doublet[heads]+=" $res1" ;;
		01) ((doubletHeadTail++))
			doublet[headtail]+=" $res1" ;;
		10) ((doubletTailHead++))
			doublet[tailhead]+=" $res1" ;;
		11) ((doubletTail++))
			doublet[tails]+=" $res1" ;;
	esac

        ((temp--))
done

echo ${doublet[heads]}
echo ${doublet[headtail]}
echo ${doublet[tailhead]}
echo ${doublet[tails]}

echo $doubletHead $trails | awk '{print "Persentage of heads combination - " ((100*$1/$2)) }'
echo $doubletHeadTail $trails | awk '{print "Persentage of head tail combination - " ((100*$1/$2)) }'
echo $doubletTailHead $trails | awk '{print "Persentage of tail head - " ((100*$1/$2)) }'
echo $doubletTail $trails | awk '{print "Persentage of tails - " ((100*$1/$2)) }'


