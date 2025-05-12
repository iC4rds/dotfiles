#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

wofi_command="wofi --show dmenu
              --conf ${CONFIG} --style ${STYLE} \
              --width=600 --height=175 \
              --cache-file=/dev/null \
              --hide-scroll --no-actions \
              --define=matching=fuzzy"

powermenu="   Powermenu"
wifi="    Wi-Fi"
bluetooth="  Bluetooth"

open_menu (){
    options="$powermenu\n$wifi\n$bluetooth"

    chosen="$(echo -e "$options" | $wofi_command --prompt )"
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
                 ~/.config/wofi/wofi-bluetooth.sh
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
