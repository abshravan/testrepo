#!/bin/bash

# Update the system
sudo zypper update

# Install the necessary dependencies
sudo zypper install -t pattern desktop-development
sudo zypper install wayland-protocols wayland-devel wlroots-devel pixman-devel meson

# Clone the Hyprland repository
git clone https://github.com/hyprland/hyprland.git

# Build and install Hyprland
meson build
ninja install

# Add Hyprland to the session manager
sudo zypper install lightdm-kde5
sudo sed -i 's/kde/hyprland/' /etc/lightdm/default.conf

# Reboot the system
sudo reboot
