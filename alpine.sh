#!/bin/sh

# Update package repositories
apk update

# Install required packages
apk add qtile py3-setuptools py3-xcffib py3-wheel py3-pip dbus-x11 wayland wayland-protocols \
  cairo-dev pango-dev gdk-pixbuf-dev libffi-dev alsa-lib-dev libxkbcommon-dev git

# Install additional dependencies for Waybar
apk add cmake fmt wayland-protocols-dev jsoncpp-dev spdlog-dev xcb-util-wm-devel xcb-util-image-devel \
  xcb-util-cursor-devel

# Install Waybar from source
git clone https://github.com/Alexays/Waybar.git
cd Waybar
mkdir build && cd build
cmake ..
make
make install

# Install Qtile and additional Python dependencies
pip install qtile

# Enable DBus for Qtile
mkdir -p /etc/xdg/autostart/
cp /usr/share/dbus-1/services/org.xfce.xfconf.service /etc/xdg/autostart/
sed -i 's/TryExec=xfconfd/TryExec=qtile/g' /etc/xdg/autostart/org.xfce.xfconf.service

# Optionally, set up a minimal Qtile configuration
mkdir -p ~/.config/qtile
cat <<EOF > ~/.config/qtile/config.py
# Your Qtile configuration goes here
# For a basic setup, you can start with examples from Qtile documentation
# https://qtile.readthedocs.io/en/latest/manual/config/index.html
EOF

# Start Wayland session with Qtile and Waybar
export QT_QPA_PLATFORM=wayland
qtile
