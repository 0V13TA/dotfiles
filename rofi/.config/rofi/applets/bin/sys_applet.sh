#!/usr/bin/env bash

# 1. Handle user input 
# Rofi passes the selected string as $1. If $1 is not empty, we execute the action.
if [ -n "$1" ]; then
    case "$1" in
        *"Volume Up"*) 
            wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ 
            ;;
        *"Volume Down"*) 
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- 
            ;;
        *"Toggle Mute"*) 
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle 
            ;;
        *"Brightness Up"*) 
            brightnessctl -e4 -n2 set 5%+ 
            ;;
        *"Brightness Down"*) 
            brightnessctl -e4 -n2 set 5%- 
            ;;
        *"Exit"*) 
            # Exiting without printing anything to stdout tells Rofi to close the window
            exit 0 
            ;;
    esac
fi

# 2. Fetch current system stats
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100 "%"}')
mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "(Muted)" || echo "")
bright=$(brightnessctl -m | awk -F, '{print $4}')
bat=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "N/A")%

# 3. Update the UI dynamically
# \0message\x1f is a Rofi protocol sequence to update the -mesg block in place
echo -en "\0message\x1f<b>  Battery:</b> $bat   |   <b>  Volume:</b> $vol $mute   |   <b>󰃠  Brightness:</b> $bright\n"

# \0keep-selection\x1ftrue prevents the cursor from jumping back to the top row after every click
echo -en "\0keep-selection\x1ftrue\n"

# 4. Print the interactive menu options
echo "󰝝"
echo "󰝞"
echo "󰖁"
echo "󰃠"
echo "󰃟"
echo "󰗼"
