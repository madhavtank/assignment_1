#!/bin/bash
FILENAME=$1
FILESIZE=$(stat -c%s "$FILENAME")
echo "Size of $FILENAME = $FILESIZE bytes."
echo
no_lines="$(wc -l <"$1")"
echo the number of lines in $1 are $no_lines.
echo
no_words="$(wc -w < $1)"
echo the number of words in $1 are $no_words.
echo
i=0
while IFS= read -r line
do
let i++
count=$(echo $line | wc -w)
echo "Line no:$i Count of words:$count"
done < $1
echo
declare -a arr
declare -a arrw
i=0
while read line
do
    for word in $line
    do
        let i++
        arrw[i]=$word
        arr[i]=1
        for ((j=1;j<i;j++))
        do
            if [ ${arrw[i]} == ${arrw[j]} ]
            then
            let arr[j]++
            break
            fi
        done
    done
done < $1
i=1
while read line
do 
    for word in $line
    do
        if [ ${arr[i]} -gt 1 ]
        then
        echo Word:${arrw[i]} Count of word:${arr[i]}
        fi
        let i++
    done
done < $1
