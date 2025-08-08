#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"

CONFIGS=("cava" "dunst" "fish" "hypr" "kitty" "nvim" "rofi" "waybar" "wofi")

for config in "${CONFIGS[@]}"; do
  if [ -e "$CONFIG_DIR/$config" ] && [ ! -L "$CONFIG_DIR/$config" ]; then
    mv "$CONFIG_DIR/$config" "$CONFIG_DIR/${config}.bak"
    echo "Backup erstellt für $config"
  fi
  
  ln -sfn "$DOTFILES_DIR/$config" "$CONFIG_DIR/$config"
  echo "Symlink erstellt für $config"
done

echo "Synchronisation abgeschlossen!"