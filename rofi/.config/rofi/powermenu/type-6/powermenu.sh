#!/usr/bin/env bash

# Rofi Power Menu for Hyprland
# Uses hyprlock + systemd

dir="$HOME/.config/rofi/powermenu/type-6"
theme='style-1'

# Info
uptime="$(uptime -p | sed -e 's/up //g')"
host="$(hostname)"

# Options
hibernate=''
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p " $USER@$host" \
		-mesg " Uptime: $uptime" \
		-theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
	rofi \
		-theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "${dir}/${theme}.rasi"
}

confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Menu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

# Execute command
run_cmd() {
	selected="$(confirm_exit)"

	if [[ "$selected" != "$yes" ]]; then
		exit 0
	fi

	case "$1" in
		--shutdown)
			systemctl poweroff
			;;

		--reboot)
			systemctl reboot
			;;

		--hibernate)
			hyprlock &
			sleep 1
			systemctl hibernate
			;;

		--suspend)
			hyprlock &
			sleep 1
			systemctl suspend
			;;

		--logout)
			hyprctl dispatch exit
			;;
	esac
}

# Actions
chosen="$(run_rofi)"

case "$chosen" in
	"$shutdown")
		run_cmd --shutdown
		;;

	"$reboot")
		run_cmd --reboot
		;;

	"$hibernate")
		run_cmd --hibernate
		;;

	"$lock")
		hyprlock
		;;

	"$suspend")
		run_cmd --suspend
		;;

	"$logout")
		run_cmd --logout
		;;
esac
