#!/bin/bash
killall mako &
/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
mako &
#swaymsg "layout tabbed" &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
