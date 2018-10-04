# iss

Simple drop-in Interactive Substring Search tool for filtering and selecting.

## What?
Ever found yourself missing your favorite shell "fuzzy finder" when working on a machine that you cannot easily install new software on?

What if I told you that you can achieve 80% of the functionality of standard fuzzy-finders in 10 lines of bash using coreutils + basic installed utils like grep? 

What if you could simply copy paste your fuzzy-finder like onto a fresh linux machine?

## Install

Copy the following and paste into your bash:
```
iss(){ i=`tee`;l=$((`tput lines`-3));t=/dev/tty;e=echo;while :;do clear >$t;>&2 $e; $e "$i" | { grep -i --color=always "$w"; yes '' | head -n$l; } |& head -n$l 2>/dev/null | tac >$t; >&2 $e;IFS= read -p "input> $w" -n1 c <$t;case $c in $'\e') >&2 $e;exit;;$'') w=${w: : -1};;$'') $e "$i" | grep -i "$w" | head -n1; exit;;$' ') w+=".*";;*) w+=$c;esac;done }
```

No, seriously. Also look at the iss script for the actual un-minified (more like un-mashed) version.

## Usuage

Simple use in a pipe:
```
<some command> | iss | <some more commands>
```

Type to filter down. Accepts grep regex. By default grep's `-i` flag is set (meaning case insensitive). `Backspace` clears last input. `Esc` quits without accepting any input. `Enter` accepts last input and quits. `Space` enters `.*` for ease of use.

## Limitations

1. Not sure how long lines are handled.
2. Typing `Backspace` with empty input quits the program with an error.
3. Cannot select with arrow keys.
4. Lot of extraneous whitespace printed out on your terminal.

## Dependencies

bash, clear, tput, coreutils (tee, head, tac, echo, yes), grep
