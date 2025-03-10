#!/bin/bash

killall dunst
brightnessctl s 10%-
notify-send "Brightness -10%"
