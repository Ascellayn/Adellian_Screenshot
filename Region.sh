#!/bin/bash
cd ~
Folder="$(cat /System/Configuration/Adellian/Screenshot_Path.txt)$(date +%Y-%m)"
Filename="$(date +%d)@$(date +%H-%M_%S).png"

if [ "${Folder:0:2}" = "~/" ]; then
	Folder=${Folder:2};
fi

mkdir -p $Folder
cd $Folder

grim -c -t ppm -o "$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')" - |\
imv-wayland -w ForceFullscreen - & PID=$!

slurp | grim -g - "$Filename"
wl-copy < "$Filename"
kill $PID

hyprctl notify 5 2000 0 "Saved Region Shot to Clipboard"