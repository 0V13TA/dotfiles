#!/usr/bin/env bash

# 1. Start the hyprpaper daemon in the background
hyprpaper &

# 2. Wait a brief moment for the daemon to initialize
sleep 1

# 3. Load the image into memory and set it to all monitors
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"

# 4. Generate the colors for your Neovim and Ghostty themes
wallust run "$WALLPAPER"
