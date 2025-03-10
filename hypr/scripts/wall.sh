#!/bin/bash

directory=~/.config/hypr/wallpapers
monitor="eDP-1"
monitor2="DP-5"
monitor3="DP-6"

random_background=$(ls $directory/*.{jpg,png} 2>/dev/null | shuf -n 1)

echo '' > ~/.config/hypr/hyprpaper.conf
echo "preload = ${random_background}" >>  ~/.config/hypr/hyprpaper.conf
echo "wallpaper =${monitor},${random_background}" >>  ~/.config/hypr/hyprpaper.conf
echo "wallpaper =${monitor2},${random_background}" >>  ~/.config/hypr/hyprpaper.conf
echo "wallpaper =${monitor3},${random_background}" >>  ~/.config/hypr/hyprpaper.conf
echo "ipc = off" >> ~/.config/hypr/hyprpaper.conf

killall hyprpaper
hyprpaper
