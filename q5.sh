#!/bin/bash
read s
echo
revstr=`echo $s | rev`
echo "$revstr"
y=`echo $s | rev` 
y=$(echo "$y" | tr "0-9a-zA-Z" "1-9a-zA-Za")
echo "$y"
len=${#s}
substr1="${s:0:(len/2)}"
substr2="${s:(len/2):len}"
revstr=`echo $substr1 | rev`
echo "$revstr""$substr2" 
