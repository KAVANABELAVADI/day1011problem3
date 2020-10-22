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

array[0]=$(echo $heads $trails | awk '{print ((100*$1/$2)) }')
array[1]=$(echo $tails $trails | awk '{print ((100*$1/$2)) }')

echo "Persentage of heads - " ${array[0]}
echo "Persentage of tails - " ${array[1]}


echo ${doublet[heads]}
echo ${doublet[headtail]}
echo ${doublet[tailhead]}
echo ${doublet[tails]}


array[2]=$(echo $doubletHead $trails | awk '{print ((100*$1/$2)) }')
array[3]=$(echo $doubletHeadTail $trails | awk '{print ((100*$1/$2)) }')
array[4]=$(echo $doubletTailHead $trails | awk '{print ((100*$1/$2)) }')
array[5]=$(echo $doubletTail $trails | awk '{print ((100*$1/$2)) }')

echo "Persentage of heads combination - " ${array[2]}
echo "Persentage of head tail combination - " ${array[3]}
echo "Persentage of tail head combination - " ${array[4]}
echo "Persentage of tails combination - " ${array[5]}


echo ${tripplet[HHH]}
echo ${tripplet[HHT]}
echo ${tripplet[HTH]}
echo ${tripplet[HTT]}
echo ${tripplet[THH]}
echo ${tripplet[THT]}
echo ${tripplet[TTH]}
echo ${tripplet[TTT]}

array[6]=$(echo $tHHH $trails | awk '{print ((100*$1/$2)) }')
array[7]=$(echo $tHHT $trails | awk '{print ((100*$1/$2)) }')
array[8]=$(echo $tHTH $trails | awk '{print ((100*$1/$2)) }')
array[9]=$(echo $tHTT $trails | awk '{print ((100*$1/$2)) }')
array[10]=$(echo $tTHH $trails | awk '{print ((100*$1/$2)) }')
array[11]=$(echo $tTHT $trails | awk '{print ((100*$1/$2)) }')
array[12]=$(echo $tTTH $trails | awk '{print ((100*$1/$2)) }')
array[13]=$(echo $tTTT $trails | awk '{print ((100*$1/$2)) }')


echo "Persentage of HHH combination - " ${array[6]}
echo "Persentage of HHT combination - " ${array[7]}
echo "Persentage of HTH combination - " ${array[8]}
echo "Persentage of HTT combination - " ${array[9]}
echo "Persentage of THH combination - " ${array[10]}
echo "Persentage of THT combination - " ${array[11]}
echo "Persentage of TTH combination - " ${array[12]}
echo "Persentage of TTT combination - " ${array[13]}

for (( i=0; i<14; i++ ))
do
        for (( j=0; j<$((14-$i-1)); j++ ))
        do
		k=$(echo ${array[$j]} | awk '{printf "%d",$1}')
		l=$(echo ${array[$(($j+1))]} | awk '{printf "%d",(($1))}')
                if [ $k -gt $l ]
                then
                    temp=${array[$j]}
                    array[$j]=${array[$(($j+1))]}
                    array[$(($j+1))]=$temp
                fi
        done
done

echo "The percentage of winning combination of these is " ${array[13]}
