#!/bin/bash
#Samuel Martinez
#Servery Health Tracking

dir=/home/$USER/syshealth

if [ ! -d $dir ]
then
        mkdir $dir 2>/dev/null
fi

date=$(date +%d-%m-%Y:%T)

file=syshlth_$date.txt
touch $dir/$file

echo "System Health Date of $date" >> $dir/$file
echo "-----------------------------------------" >> $dir/$file
pstree >>  $dir/$file
echo "-----------------------------------------" >> $dir/$file
ps >> $dir/$file
echo "-----------------------------------------" >> $dir/$file
uptime >> $dir/$file

days=uptime | awk '{print $3}'

if [ $days>2 ]
then
        echo "Consider rebooting as system has been up for longer than a day" >> $dir/$file
fi
echo "-----------------------------------------" >> $dir/$file
cat /proc/meminfo >> $dir/$file
echo "-----------------------------------------" >> $dir/$file
sudo iptables -L --line-number >> $dir/$file
echo "-----------------------------------------" >> $dir/$file
