#!/usr/bin/env bash

if pgrep "picom" > /dev/null 2>&1; then
	killall -9 picom
	dunstify "Picom Disabled"
else
	#bash ./launch.sh
	picom -bCG
	dunstify "Picom Enabled"
fi
