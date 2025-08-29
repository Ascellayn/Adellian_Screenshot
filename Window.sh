#!/bin/bash
cd ~
Folder="$(cat /System/Configuration/Adellian/Screenshot_Path.txt)$(date +%Y-%m)"
Filename="$(date +%d)@$(date +%H-%M_%S).png"

if [ "${Folder:0:2}" = "~/" ]; then
	Folder=${Folder:2};
fi

mkdir -p $Folder
cd $Folder

hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' |\
grim -g -c - "$Filename"
wl-copy < "$Filename"


hyprctl notify 5 2000 0 "Saved Window Shot to Clipboard"