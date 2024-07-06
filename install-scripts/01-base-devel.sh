#!/bin/bash

base=(
  base-devel
)
source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_base.log"

# Installation of main components
printf "\n%s - Installing base-devel if not installed \n" "${NOTE}"

for PKG1 in "${base[@]}"; do
  sudo pacman -S --noconfirm "$PKG1" | tee -a "$LOG"
done

clear
