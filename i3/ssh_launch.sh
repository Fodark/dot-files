#!/bin/bash
list="$(ls /tmp/)"

for j in $list;
do
	if [[ $j == ssh-* ]]; then
		#echo $j;
		dir="/tmp/$j"
		newlist=$(ls $dir)
		for k in $newlist;
		do
			sock="$dir/$k"
			echo $sock
			export SSH_AUTH_SOCK=$sock
		done
	fi
done
