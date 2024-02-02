#!/bin/bash

# Function to display available WiFi networks
display_wifi_networks() {
    echo "Available WiFi Networks:"
    nmcli device wifi list
}

# Function to connect to a WiFi network
connect_to_wifi() {
    read -p "Enter the WiFi SSID you want to connect to: " ssid
    read -s -p "Enter the WiFi password: " password
    echo

    nmcli device wifi connect "$ssid" password "$password"
}

# Main menu
while true; do
    echo "1. Display available WiFi networks"
    echo "2. Connect to a WiFi network"
    echo "3. Quit"

    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            display_wifi_networks
            ;;
        2)
            connect_to_wifi
            ;;
        3)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 3."
            ;;
    esac
done
