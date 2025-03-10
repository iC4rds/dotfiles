#!/bin/bash

killall dunst

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+

volume_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

volume=$(echo "$volume_info" | grep -oP '(?<=Volume: )[\d.]+')
muted=$(echo "$volume_info" | grep -oP '(?<=Muted: )(true|false)')

if [[ "$muted" == "true" ]]; then
    message="🔇 Muted"
else
    volume_percent=$(awk "BEGIN {printf \"%.0f\", $volume * 100}")
    message="🔊 Volume: $volume_percent%"
fi

notify-send "audio status:" "$message"
