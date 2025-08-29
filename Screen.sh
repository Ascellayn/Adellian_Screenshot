#!/bin/bash
cd ~
Folder="$(cat /System/Configuration/Adellian/Screenshot_Path.txt)$(date +%Y-%m)"
Filename="$(date +%d)@$(date +%H-%M_%S).png"

if [ "${Folder:0:2}" = "~/" ]; then
	Folder=${Folder:2};
fi

mkdir -p $Folder
cd $Folder

grim -c - "$Filename"
wl-copy < "$Filename"

hyprctl notify 5 2000 0 "Saved Screenshot to Clipboard"