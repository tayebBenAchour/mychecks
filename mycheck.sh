#!/bin/bash

sed -n "3p;$(wc -l myinput.yaml | cut -d " " -f 1)p" myinput.yaml > tmp
while read -r line
do
host=$(echo $line | tr -d [:space:] | cut -d ":" -f 2)
res=$(ping -c 2 $host 2> /dev/null)
if [ "$?" != 0 ];then
echo "✗ $host"
else
echo "✔$host"
fi 
done < tmp 
rm tmp
