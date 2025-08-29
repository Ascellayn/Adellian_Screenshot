#!/bin/bash
cd ~
Folder="$(cat /System/Configuration/Adellian/Screenshot_Path.txt)$(date +%Y-%m)"
Filename="$(date +%d)@$(date +%H-%M_%S).mkv"

if [ "${Folder:0:2}" = "~/" ]; then
	Folder=${Folder:2};
fi

mkdir -p $Folder
cd $Folder

PID=$(ps -o ppid= -p $PPID) # Don't ask me why, but I have to leave this line in even though I don't do shit with it or hyprctl doesn't do anything.
#echo $PPID
#echo $PID

hyprctl dispatch setfloating pid:$PPID
hyprctl dispatch resizewindowpixel exact 495 90,pid:$PPID
hyprctl dispatch movewindowpixel exact 80% 92%,pid:$PPID
hyprctl dispatch pin pid:$PPID

Geometry=$(slurp)
wf-recorder -g "$Geometry" -a --audio-backend=pipewire -c $(cat /System/Configuration/Adellian/Screenshot_Encoder.txt) -C flac -D -r 60 -f "$Filename" & PID=$!


echo "file://$(pwd)/$Filename" | wl-copy -t text/uri-list

sleep 1 && read -p "Press ENTER to stop recording."
kill -INT $PID

hyprctl notify 5 2000 0 "Saved Video to Clipboard"