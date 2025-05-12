#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
##
## Wofi Powermenu

## Files
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

## Wofi Command
wofi_command="wofi --show dmenu \
			--conf ${CONFIG} --style ${STYLE} \
			--width=600 --height=257 \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--define=matching=fuzzy"

uptime=$(uptime -p | sed -e 's/up //g')

## Entries
shutdown="   Shutdown"
reboot="   Reboot"
lock="   Lock"
suspend="   Sleep"
logout="   Logout"

# Variable passed to rofi
open_menu () {
	options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

	chosen="$(echo -e "$options" | $wofi_command --prompt "UP - $uptime")"
	case $chosen in
		$shutdown)
			if [[ "$?" == 0 ]]; then
				systemctl poweroff
			else
				exit
			fi
			;;
		$reboot)
			if [[ "$?" == 0 ]]; then
				systemctl reboot
			else
				exit
			fi
			;;
		$lock)
			hyprlock
			;;
		$suspend)
			if [[ "$?" == 0 ]]; then
				mpc -q pause
				pulsemixer --mute
				~/.config/hypr/scripts/lockscreen
				systemctl suspend
			else
				exit
			fi
			;;
		$logout)
			if [[ "$?" == 0 ]]; then
				hyprctl dispatch exit 0

			else
				exit
			fi
			;;
	esac
}

if [[ ! `pidof wofi` ]]; then
	open_menu
else
	pkill wofi
fi
