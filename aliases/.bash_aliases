alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"; rm $HOME/.rangerdir'

alias reflect='reflector -c "United States" --sort "score" -p "https"'

alias pacsize='LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h'
