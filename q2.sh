#!/bin/bash
file="quotes.txt"
touch speech.txt
while IFS= read -r line
do
p1=`cut -d "~" -f2- <<< "$line"`
p2=`echo $line | cut -d "~" -f1`
if [ -z "$line" ]
then
continue
else
echo "$p1 once said, \""$p2"\""
fi
done < "$file" > speech.txt