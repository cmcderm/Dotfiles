# Aliases
alias sudo='sudo '

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"; rm $HOME/.rangerdir'

alias reflect='reflector --latest 200 -c "United States" --sort "rate" -p "https" --save /etc/pacman.d/mirrorlist'

