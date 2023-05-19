#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi
echo "Welcome to fullstach devlopment enviorment setup script by A.B.Shravan krishna \n"
echo "loading......" 
# Update system
echo "Updating system..."
apt update
apt upgrade -y

# Install development tools and utilities
echo "Installing development tools and utilities..."
apt install -y build-essential git curl wget

# Install Node.js
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt install -y nodejs

# Install Python
echo "Installing Python..."
apt install -y python3 python3-pip

# Install databases
echo "Installing databases..."
apt install -y mysql-server postgresql

# Install web server (Apache or Nginx)
echo "Installing web server..."
apt install -y apache2

# Install PHP
echo "Installing PHP..."
apt install -y php libapache2-mod-php php-mysql

# Install Ruby
echo "Installing Ruby..."
apt install -y ruby

# Install Java
echo "Installing Java..."
apt install -y default-jdk

# Install IDEs and text editors
echo "Installing IDEs and text editors..."
snap install code --classic
snap install pycharm-community --classic
snap install intellij-idea-community --classic
apt install -y vim

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com | bash
usermod -aG docker $USER

# Install version control systems
echo "Installing version control systems..."
apt install -y git subversion

# Install additional tools and libraries
echo "Installing additional tools and libraries..."
apt install -y jq imagemagick

# Install Xamp for hosting the website

# Clean up
echo "Cleaning up..."
apt autoremove -y

echo "Full stack development environment setup complete."
