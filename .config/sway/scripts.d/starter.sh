#!/bin/bash
. $HOME/.config/sway/scripts.d/vars.conf
killall mako &
/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
mako &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
wl-paste -w wl-paste -p >> $clipfile

