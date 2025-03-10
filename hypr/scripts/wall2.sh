#!/bin/bash

directory=~/.config/hypr/wallpapers
monitor="eDP-1"

random_background=$(ls $directory/*.jpg | shuf -n 1)

hyprctl hyprpaper unload all
hyprctl hyprpaper preload $random_background
hyprctl hyprpaper wallpaper "$monitor, $random_background"

killall hyprpaper
hyprpaper
