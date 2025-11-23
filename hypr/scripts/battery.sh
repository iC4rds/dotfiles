#!/bin/bash

# Batterie-Level auslesen
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Icon basierend auf Ladestatus und Level
if [ "$battery_status" = "Charging" ]; then
    icon="󰂄"  # Lade-Icon
elif [ "$battery_status" = "Full" ]; then
    icon="󰁹"  # Voll-Icon
else
    # Batterie-Icons basierend auf Level
    if [ "$battery_level" -ge 90 ]; then
        icon="󰁹"
    elif [ "$battery_level" -ge 70 ]; then
        icon="󰂀"
    elif [ "$battery_level" -ge 50 ]; then
        icon="󰁾"
    elif [ "$battery_level" -ge 30 ]; then
        icon="󰁼"
    elif [ "$battery_level" -ge 10 ]; then
        icon="󰁺"
    else
        icon="󰂃"
    fi
fi

# Ausgabe
echo "$icon  $battery_level%"
