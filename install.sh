#!/usr/bin/env bash

#It will check the script is not running as root,if as root it will exit.
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi

clear

# Create Directory for Install Logs
if [ ! -d Install-Logs ]; then
    mkdir Install-Logs
fi

# Define the directory where your scripts are located
script_directory=install-scripts

# Function to execute a script if it exists and make it executable
execute_script() {
    local script="$1"
    local script_path="$script_directory/$script"
    if [ -f "$script_path" ]; then
        chmod +x "$script_path"
        if [ -x "$script_path" ]; then
            env USE_PRESET=$use_preset  "$script_path"
        else
            echo "Failed to make script '$script' executable."
        fi
    else
        echo "Script '$script' not found in '$script_directory'."
    fi
}

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
execute_script "05-hyprland.sh"

# Install fonts
execute_script "06-fonts.sh"

# Insatll nvidia
execute_script "07-nvidia.sh"


printf "\n${OK} Installation Completed.Base Hyprland installed\n"
printf "\n"
printf "\n${NOTE} You can start Hyprland by typing Hyprland if you did not install any login managers.\n"
printf "\n"
printf "\n${NOTE} Now you can reboot your system.\n\n"
