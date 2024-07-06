#!/usr/bin/env bash

#It will check the script is not running as root,if as root it will exit.
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi

clear

# It will make all scripts folders executable.
chmod +x install-scripts/*
sleep 0.5

# Installing base-devel if not installed
execute_script "01-base-devel.sh"
sleep 0.5
execute_script "02-pacman.sh"
sleep 0.5

#Installing AUR-helper (YAY)
execute_script "03-yay.sh"

# Install hyprland packages
execute_script "04-hyprlandpkgs.sh"
execute_script "05-hyprland.sh

# Install fonts
execute_script "06-fonts.sh"

# Insatll nvidia
execute_script "07-nvidia.sh"


printf "\n${OK} Installation Completed.Base Hyprland installed\n"
printf "\n"
printf "\n${NOTE} You can start Hyprland by typing Hyprland if you did not install any login managers.\n"
printf "\n"
printf "\n${NOTE} Now you can reboot your system.\n\n"
