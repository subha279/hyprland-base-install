#!/bin/bash

# Fonts #

fonts=(
  # Fonts
  adobe-source-code-pro-fonts
  noto-fonts-emoji
  otf-font-awesome
  ttf-droid
  ttf-fira-code
  ttf-jetbrains-mono
  ttf-jetbrains-mono-nerd
  ttf-inconsolata
  ttf-jetbrains-mono
  ttf-jetbrains-mono-nerd
  ttf-cascadia-code-nerd
  noto-fonts
  ttf-joypixels
  ttf-nerd-fonts-symbols
  nerd-fonts-sf-mono
  
  # Themes & Icons
  kora-icon-theme
  whitesur-gtk-theme
)

# Determine the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

source "$(dirname "$(readlink -f "$0")")/00-pacman-yay-install-functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_fonts.log"

# Installation of main components
printf "\n%s - Installing fonts.... \n" "${NOTE}"

for PKG1 in "${fonts[@]}"; do
  install_package "$PKG1" 2>&1 | tee -a "$LOG"
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG1 Package installation failed, Please check the installation logs"
    exit 1
  fi
done
