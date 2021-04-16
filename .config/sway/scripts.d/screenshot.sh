#!/bin/bash
. $HOME/.config/sway/scripts.d/vars.conf
[[ "$(ps aux | grep -v grep | grep -io swappy)" == "swappy" ]] && kill -9 $(ps aux | grep -v grep | grep -i swappy | awk '{print $2}')
case $1 in
	rec)
		grim -g "0,0 $screenres" /tmp/screenshot.png
		feh -F /tmp/screenshot.png &
		slurpout=$(slurp)
		grim -g "$slurpout" - | wl-copy
		killall feh
		grim -g "$slurpout" - | swappy -f -
		rm /tmp/screenshot.png
	;;
	full)
		grim -g "0,0 $screenres" - | wl-copy
		grim -g "0,0 $screenres" - | swappy -f -
	;;
	fullsave)
		_date=$(date +%d%m%Y_%H%M%S)
		grim -g "0,0 $screenres" $HOME/Pictures/grim/IMG_$_date.jpg && notify-send "The photo was saved to $HOME/Pictures/grim/ with the name IMG_$_date.jpg" || notify-send "The photo could not be saved"
	;;
esac
