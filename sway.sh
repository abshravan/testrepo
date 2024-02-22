#!/bin/bash

# Update the package list
sudo apt update

# Install basic packages and dependencies
sudo apt install -y \
    sway \
    swaybg \
    swayidle \
    swaylock \
    waybar \
    xwayland \
    rofi \
    grim \
    slurp \
    kanshi \
    wl-clipboard \
    mako \
    bemenu \
    bemenu-ncurses \
    alacritty \
    bemenu \
    bemenu-ncurses \
    mako \
    wl-clipboard \
    grim \
    slurp \
    kanshi \
    jq \
    yad \
    playerctl \
    lightdm \
    lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings \
    xorg \
    xwayland \
    xorg-input-synaptics  # Include this line if you have a touchpad and want to use Synaptics driver

# Optional: Install additional tools for a better experience
# sudo apt install -y alacritty firefox

# Enable LightDM service
sudo systemctl enable lightdm

# Note: You might need to create a Sway configuration file in ~/.config/sway/config
# before running Sway. You can find example configurations on the Sway GitHub repository.

echo "Sway Tiling Window Manager, LightDM, Xorg, and dependencies have been installed. You may need to create a Sway configuration file before running it."
