#!/bin/bash
cd ~
Folder="$(cat /System/Configuration/Adellian/Screenshot_Path.txt)$(date +%Y-%m)"
Filename="$(date +%d)@$(date +%H-%M_%S).mkv"

if [ "${Folder:0:2}" = "~/" ]; then
	Folder=${Folder:2};
fi

mkdir -p $Folder
cd $Folder

wf-recorder -g "$(slurp)" -a --audio-backend=pipewire -c $(cat /System/Configuration/Adellian/Screenshot_Encoder.txt) -C flac -D -r 60 -f "$Filename"
echo "file://$(cwd)/$Filename" | wl-copy -t text/uri-list