#!/bin/bash

directory=~/.config/hypr/wallpapers
monitor="eDP-1"
monitor2="DP-5"
monitor3="DP-6"
monitorSAP="DP-1"

selected_background=$(
    ls $directory/*.{jpg,png} | while read img; do
        echo -e "$(basename "$img")\x00icon\x1f$img"
    done | rofi -dmenu -show-icons -p "Wallpaper" -i \
        -theme ~/.config/rofi/catppuccin_mocha.rasi \
        -display-dpi 192 \
        -fake-transparency
)

# Vollständiger Pfad wiederherstellen
selected_background="$directory/$selected_background"

# Hyprpaper konfigurieren
[ -f "$selected_background" ] && cat > ~/.config/hypr/hyprpaper.conf <<EOF
wallpaper {
  monitor = $monitor
  path = $selected_background
  fit_mode = cover
}
wallpaper {
  monitor = $monitor2
  path = $selected_background
  fit_mode = cover
}
wallpaper {
  monitor = $monitor3
  path = $selected_background
  fit_mode = cover
}
wallpaper {
  monitor = $monitorSAP
  path = $selected_background
  fit_mode = cover
}
splash = false
EOF

# Hyprpaper neustarten
killall hyprpaper
hyprpaper &
