#!/bin/bash

i=`tee`
w=""
#l=$(($(tput lines)-1))
l=10
while :
do
	clear >/dev/tty;
  >&2 echo; echo "$i" | grep --color=always "$w" | head -n$l >&2; >&2 echo;
	read -p "input> $w" -n1 c </dev/tty
	case $c in 
		$'\e') >&2 echo;exit;;
		$'') w=${w: : -1};;
		$'') echo "$i" | grep "$w" | head -n1; exit;;
		*) w+=$c;
	esac
done
