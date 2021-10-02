#!/bin/sh

#Replace start and end date of the time period in the format: MMM DD YYYY

startDate=`date -d "Aug 4 2020" +%j`
endDate=`date -d "Oct 21 2021" +%j`
curr=`date -d now +%j`

sumdays=$(($endDate-$startDate))
daysrem=$(($endDate-$curr))


re=$(($daysrem/7))
rem=$(($daysrem%7))


case $daysrem in
	0) echo " Time's up!";;
	1) echo " Tomorrow is the day!";;
	[1-9]*) printf " Specified time period ends in $daysrem days. \n ($re weeks, $rem days)\n";;
	-[0-9]*) echo " Timer expired. Update script countdwn.sh.";;
esac

#Replace "75.0" with the sum of days of your time period and concatenate ".0"
#Delete hash in the line below to inqire the sum
#echo $sumdays

ptonval=`python -c "print 100-$daysrem/75.0*100"`
pastd=$(($sumdays-$daysrem))

echo -n " ["
for j in $(seq 1 $pastd); do printf "%0.s#"; done
for i in $(seq 1 $daysrem); do printf "%0.s."; done
printf "] "
printf $ptonval ; echo " %"


