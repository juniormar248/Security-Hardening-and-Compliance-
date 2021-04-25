#!/bin/bash #This line chooses the interpreter
#Samuel Martinez #This line is commented out 
#Servery Health Tracking #This line is commmented out

dir=/home/$USER/syshealth # This line saves the directory location as variable $DIR

if [ ! -d $dir ] # This line starts an if statement and if the directory given isnt a directory it runs the folling command
then # this starts the next command
        mkdir $dir 2>/dev/null # This creates a new directory and cancels out the error message when it tries to creat one but it already exist 
fi # this ends the if statement

date=$(date +%d-%m-%Y:%T) # this saves the out put of the date command with specific information into the variable $DATE

file=syshlth_$date.txt # This saves the directory location and the name of the new file while using the $DIR variable and $DATE variable to create a unique file name
touch $dir/$file # This creates a new file using the $FN variable

echo "System Health Date of $date" >> $dir/$file # This line prints text to the file
echo "-----------------------------------------" >> $dir/$file # This line prints text to the file
pstree >>  $dir/$file #This line prints the command to the file
echo "-----------------------------------------" >> $dir/$file # This line prints text to the file
ps >> $dir/$file #This line prints the command to the file
echo "-----------------------------------------" >> $dir/$file # This line prints text to the file
uptime >> $dir/$file #This line prints the command to the file

days=$(uptime | awk '{print $5}') # this saves the out put of the awk of uptime to variable days

if [ $days>2 ] # This line starts an if statement and if the variable day is greater than 2 it runs
then# this starts the next command
        echo "Consider rebooting as system has been up for longer than a day" >> $dir/$file# This line prints text to the file
fi# this ends the if statement
echo "-----------------------------------------" >> $dir/$file # This line prints text to the file
cat /proc/meminfo >> $dir/$file #This line prints the command to the file
echo "-----------------------------------------" >> $dir/$file # This line prints text to the file
sudo iptables -L --line-number >> $dir/$file #This line prints the command to the file
echo "-----------------------------------------" >> $dir/$file # This line prints text to the file
