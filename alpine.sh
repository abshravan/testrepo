#!/bin/bash

# Update the Alpine Linux package manager
apk update

# Install the necessary packages for Qtile, Waybar, and Wayland
apk add --no-cache qtile pycairo xorg wlroots dbus alsa-utils

# Install the Wayland compositor Weston
apk add weston

# Create a new Qtile user and set it as the default user
adduser --shell /bin/sh qtile
usermod -s /bin/bash qtile
usermod -aG audio qtile

# Set the default Wayland backend for Qtile
echo "QT_QPA_PLATFORM=wayland" > ~/.profile

# Create a new systemd service file for Qtile
cat > /etc/systemd/system/qtile.service << EOF
[Unit]
Description=Qtile window manager
After=weston.service

[Service]
Type=simple
User=qtile
ExecStart=/bin/qtile
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the Qtile systemd service
systemctl enable qtile.service
systemctl start qtile.service

# Install Waybar
apk add waybar

# Create a new Waybar configuration file
cat > ~/.config/waybar/config.yml << EOF
bar {
    position = 'top'
    monitor = 'default'
    modules {
        clock {
            format = '%a %b %d %H:%M:%S'
        }
        windowlist {
            border = false
        }
    }
}
EOF

# Start Waybar
waybar
