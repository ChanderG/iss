# iss

Simple drop-in Interactive Substring Search tool for filtering and selecting.

## What?
Ever found yourself missing your favorite shell "fuzzy finder" when working on a machine that you cannot easily install new software on?

What if I told you that you can achieve 80% of the functionality of standard fuzzy-finders in 10 lines of bash using coreutils + basic installed utils like grep? 

What if you could simply copy paste your fuzzy-finder like onto a fresh linux machine?

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
