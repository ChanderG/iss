#!/bin/bash

i=`tee`; w=""; l=$(($(tput lines)-3))
while :
do
	clear >/dev/tty;
  >&2 echo; echo "$i" | { grep -i --color=always "$w"; yes '' | head -n$l; } |& head -n$l >/dev/tty 2>/dev/null; >&2 echo;
	read -p "input> $w" -n1 c </dev/tty
	case $c in 
		$'\e') >&2 echo;exit;;
		$'') w=${w: : -1};;
		$'') echo "$i" | grep -i "$w" | head -n1; exit;;
		*) w+=$c;
	esac
done
