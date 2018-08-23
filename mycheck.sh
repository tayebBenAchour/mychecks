#!/bin/bash

# this command keeps only the hosts part 
sed -n "3p;$(wc -l myinput.yaml | cut -d " " -f 1)p" myinput.yaml > tmp

# looping over hosts from the tmp file to check whether the host is available or not
while read -r line
do
 host=$(echo $line | tr -d [:space:] | cut -d ":" -f 2)
# redirecting the ping errors to the trash
 res=$(ping -c 2 $host 2> /dev/null)
 if [ "$?" != 0 ];then
  echo "✗ $host"
 else
  echo "✔ $host"
 fi 
done < tmp 

# removing the tmp file 
rm tmp
