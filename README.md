<p align="center">
  <img src="https://github.com/Ascellayn/Adellian/blob/main/Ressources/AdellianBanner-256px.png?raw=true"/>
</p>
<h1 align=center>
  The Screenshot Scripts
</h1>

This repository is an "Adellian Application" designed for Adellian's Hyprllian Branch. These scripts should be pretty universal, with the exception of the scripts being required to be ran inside Hyprland.  

<br>

## Dependencies
- grim
- imv
- pipewire
- slurp
- wf-recorder
- wl-clipboard
- wireplumber

<br>

## Required Adellian Files
### /System/Configuration/Adellian/Screenshot_Path.txt
This file contains the absolute path to where Screenshots should be saved.
```txt
~/Pictures/Screenshots
```
### /System/Configuration/Adellian/Screenshot_Encoder.txt
This file contains the encoder that wf-recorder should use.
```txt
h264_nvenc
```

### Default Adellian Keybinds
```txt
PRINT_SCREEN			→	Capture the whole screen
PRINT_SCREEN + CTRL		→	Capture a region of the screen
PRINT_SCREEN + ALT		→	Capture the currently focused window
PRINT_SCREEN + SHIFT	→	Capture a region of the screen and record a video. Requires to do "CTRL+C" on the Terminal Window to stop recording.
```

#### Hyprland Binds
```txt
# Screenshot Binds
bind    =   ,           PRINT,  exec,   /bin/bash -c /System/Applications/Screenshot/Screen.sh
bind    =   $CTRL,      PRINT,  exec,   /bin/bash -c /System/Applications/Screenshot/Region.sh
bind    =   $Alt,       PRINT,  exec,   /bin/bash -c /System/Applications/Screenshot/Window.sh
bind    =   $Shift,     PRINT,  exec,   $Terminal /System/Applications/Screenshot/Video.sh
bind    =   $System,    PRINT,  exec,   thunar ~/Pictures/Screenshots/$(date +%Y-%m)
```
