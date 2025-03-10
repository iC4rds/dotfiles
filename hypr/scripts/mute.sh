#!/bin/bash

killall dunst

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

notify-send "mute toggled"
