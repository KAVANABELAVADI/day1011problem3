#!/bin/bash

declare -A singlet
declare -A doublet
declare -A tripplet
heads=0
tails=0;
doubletHead=0;
doubletHeadTail=0;
doubletTailHead=0;
doubletTail=0;

tHHH=0;
tHHT=0;
tHTH=0;
tHTT=0;
tTHH=0;
tTHT=0;
tTTH=0;
tTTT=0;

read -p "Enter Number of Trails - " trails
temp=$trails

while [ $temp -gt 0 ]
do
	#singlet
	res=$((RANDOM % 2))
	if [ $res == 0 ]
        then
                (( heads++ ))
                singlet[heads]+=" $res"
        else
                (( tails++ ))
                singlet[tails]+=" $res"
        fi

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

	#tripplet
	res2=$res1$((RANDOM%2))

	case $res2 in
		000) ((tHHH++))
			tripplet[HHH]+=" $res2" ;;
		001) ((tHHT++))
			tripplet[HHT]+=" $res2";;
		010) ((tHTH++))
			tripplet[HTH]+=" $res2";;
		011) ((tHTT++))
			tripplet[HTT]+=" $res2";;
		100) ((tTHH++))
			tripplet[THH]+=" $res2";;
		101) ((tTHT++))
			tripplet[THT]+=" $res2";;
		110) ((tTTH++))
			tripplet[TTH]+=" $res2";;
		111) ((tTTT++))
			tripplet[TTT]+=" $res2";;
	esac


        ((temp--))
done


echo ${singlet[heads]}
echo ${singlet[tails]}

echo $heads $trails | awk '{print "Persentage of heads - " ((100*$1/$2)) }'
echo $tails $trails | awk '{print "Persentage of tails - " ((100*$1/$2)) }'
echo ${doublet[heads]}
echo ${doublet[headtail]}
echo ${doublet[tailhead]}
echo ${doublet[tails]}


echo $doubletHead $trails | awk '{print "Persentage of heads combination - " ((100*$1/$2)) }'
echo $doubletHeadTail $trails | awk '{print "Persentage of head tail combination - " ((100*$1/$2)) }'
echo $doubletTailHead $trails | awk '{print "Persentage of tail head combination- " ((100*$1/$2)) }'
echo $doubletTail $trails | awk '{print "Persentage of tails - " ((100*$1/$2)) }'

echo ${tripplet[HHH]}
echo ${tripplet[HHT]}
echo ${tripplet[HTH]}
echo ${tripplet[HTT]}
echo ${tripplet[THH]}
echo ${tripplet[THT]}
echo ${tripplet[TTH]}
echo ${tripplet[TTT]}

echo $tHHH $trails | awk '{print "Persentage of HHH combination - " ((100*$1/$2)) }'
echo $tHHT $trails | awk '{print "Persentage of HHT combination - " ((100*$1/$2)) }'
echo $tHTH $trails | awk '{print "Persentage of HTH combination - " ((100*$1/$2)) }'
echo $tHTT $trails | awk '{print "Persentage of HTT combination - " ((100*$1/$2)) }'
echo $tTHH $trails | awk '{print "Persentage of THH combination - " ((100*$1/$2)) }'
echo $tTHT $trails | awk '{print "Persentage of THT combination - " ((100*$1/$2)) }'
echo $tTTH $trails | awk '{print "Persentage of TTH combination - " ((100*$1/$2)) }'
echo $tTTT $trails | awk '{print "Persentage of TTT combination - " ((100*$1/$2)) }'
