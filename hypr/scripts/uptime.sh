#!/bin/bash

# Uptime auslesen
uptime_seconds=$(cat /proc/uptime | awk '{print int($1)}')

# In Tage, Stunden, Minuten umrechnen
days=$((uptime_seconds / 86400))
hours=$(((uptime_seconds % 86400) / 3600))
minutes=$(((uptime_seconds % 3600) / 60))

# Icon
icon="󰔟"

# Ausgabe formatieren
if [ $days -gt 0 ]; then
    echo "$icon  ${days}d ${hours}h ${minutes}m"
elif [ $hours -gt 0 ]; then
    echo "$icon  ${hours}h ${minutes}m"
else
    echo "$icon  ${minutes}m"
fi
