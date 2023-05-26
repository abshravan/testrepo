#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

echo "Welcome to the yacc and bison install script by A.B.Shravan Krishna"
sudo apt update 
sudo apt -y install bison flex
sudo apt -y install code 
echo ">>>>>>>>>>>>>>>>>>>>>>>>>Instalation complete<<<<<<<<<<<<<<<<<<<<<<"