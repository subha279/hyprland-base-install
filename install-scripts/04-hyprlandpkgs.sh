#!/bin/bash

# Hyprland Packages #

# edit your packages desired here.
# WARNING! If you remove packages here, dotfiles may not work properly.
# and also, ensure that packages are present in AUR and official Arch Repo

# add packages wanted here
Extra=(

)

hypr_package=(
  curl
  grim
  gvfs
  gvfs-mtp
  hyprlock-git
  imagemagick
  inxi
  dosfstools
  ntfsprogs
  stow
  wf-recorder
  v4l2loopback-dkms
  v4l2loopback-utils
  gstreamer
  ffmpeg
  oh-my-posh
  zsh
  kitty
  neovim
  network-manager-applet
  pamixer
  bluez
  bluez-utils
  blueman
  pavucontrol
  pipewire
  wireplumber
  pipewire-audio
  pipewire-alsa
  pipewire-pulse
  pipewire-alsa
  playerctl
  qt5ct
  qt6ct
  qt6-svg
  rofi-wayland
  slurp
  thunar
  swww
  waybar
  wget
  dunst
  xdg-user-dirs
  xdg-utils
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  brightnessctl
  btop
  cava
  pywal
  vlc
  nwg-look-bin
  pacman-contrib
  breezex-cursor-theme
  bibata-cursor-theme
  unzip
  usbutils
  v4l-utils
  clang
  yazi
  ttf-inconsolata
  ttf-jetbrains-mono
  ttf-jetbrains-mono-nerd
  ttf-cascadia-code-nerd
  noto-fonts
  ttf-joypixels ttf-terminus-nerd
  simple-mtfs
  clang
  lsusb

)

# Determine the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

source "$(dirname "$(readlink -f "$0")")/00-pacman-yay-install-functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_hypr-pkgs.log"

# Installation of main components
printf "\n%s - Installing hyprland packages.... \n" "${NOTE}"

for PKG1 in "${hypr_package[@]}" "${hypr_package_2[@]}" "${Extra[@]}"; do
  install_package "$PKG1" 2>&1 | tee -a "$LOG"
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG1 Package installation failed, Please check the installation logs"
    exit 1
  fi
done

printf " Activating Bluetooth Services...\n"
sudo systemctl enable --now bluetooth.service 2>&1 | tee -a "$LOG"

printf "Activating Pipewire Services...\n"
sudo systemctl --user enable --now pipewire.socket pipewire-pulse.socket wireplumber.service 2>&1 | tee -a "$LOG"
sudo systemctl --user enable --now pipewire.service 2>&1 | tee -a "$LOG"

clear
