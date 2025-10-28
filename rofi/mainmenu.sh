#!/usr/bin/env bash

rofi_command="rofi -dmenu
              -theme ~/.config/rofi/catppuccin_mocha.rasi \
              -width=600 -height=175 \
              -cache-file=/dev/null \
              -hide-scroll -no-actions \
              -define=matching=fuzzy"

powermenu="    Powermenu"
wifi="    Wi-Fi"
bluetooth="    Bluetooth"

open_menu (){
    options="$powermenu\n$wifi\n$bluetooth"

    chosen="$(echo -e "$options" | $rofi_command --prompt )"
    case $chosen in
        $powermenu)
            if [[ "$?" == 0 ]]; then
                ~/.config/wofi/wofi-power-menu.sh
            else
                exit
            fi
            ;;
        $wifi)
            if [[ "$?" == 0 ]]; then
                ~/.config/wofi/wofi-wifi-menu.sh
            else
                exit
            fi
            ;;
        $bluetooth)
            if [[ "$?" == 0 ]]; then
                 ~/.config/rofi/rofi-bluetooth.sh
             else
                 exit
            fi
            ;;
    esac
}

if [[ ! `pidof rofi` ]]; then
    open_menu
else
    pkill rofi
fi
