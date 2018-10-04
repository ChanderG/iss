#!/bin/bash

i=`tee`;l=$((`tput lines`-3));t=/dev/tty;e=echo
while :;do
	clear >$t;
	>&2 $e; $e "$i" | { grep -i --color=always "$w"; yes '' | head -n$l; } |& head -n$l 2>/dev/null | tac >$t; >&2 $e;
	IFS= read -p "input> $w" -n1 c <$t
	case $c in 
		$'\e') >&2 $e;exit;;
		$'\177') w=${w: : -1};;
		$'') $e "$i" | grep -i "$w" | head -n1; exit;;
		$' ') w+=".*";;
		*) w+=$c;
	esac
done
