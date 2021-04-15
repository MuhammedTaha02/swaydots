#!/bin/bash
[[ "$(ps aux | grep -v grep | grep -io swappy)" == "swappy" ]] && kill $(ps aux | grep -v grep | grep -i swappy | awk '{print $2}')
case $1 in
	rec)
		slurpout=$(slurp)
		grim -g "$slurpout" - | wl-copy
		grim -g "$slurpout" - | swappy -f -
	;;
	full)
		grim -g "0,0 1920x1080" - | wl-copy
		grim -g "0,0 1920x1080" - | swappy -f -
	;;
esac
