---
id: Arch_Install
aliases: []
tags: []
---

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

## PKGS installed Including AUR Pkgs

hyprland-git
kitty
waybar
git
neovim
zen-browser-bin
gvfs
android-file-transfer
thunar
stow
awww
brightnessctl
rofi
network-manager-applet
bluez
bluez-utils
blueman
copyq
wl-clipboard
grim
slurp
nwg-look
unzip
gimp
libreoffice-fresh
intel-ucode
vlc
vlc-plugins-all
tmux
pyright
npm
fd
nvidia
nvidia-utils
nvidia-prime
intel-media-driver
ffmpeg
nvenc
markdownlint-cli
pacman-contrib
terminus-font
noto-fonts-emoji
nerd-fonts
prettier
shmft
cmake-format
ripgrep
luarocks
lua-language-server
wget
python-pip
plymouth
cantarell-fonts
ttf-dejavu
fzf
zoxide
zsh
starship
discord
vscode
xdg-desktop-portal
xdg-desktop-portal-gtk
hyprpolkitagent
swaync
swayosd - sudo systemctl enable --now swayosd-libinput-backend.service

# For Gaming

Youtube - https://youtu.be/DA5rx7Dw1UI?si=iOhRaHuzn4_xMthp
steam
linux-zen
linux-zen-headers
gamemode
protonup-qt
sudo pacman -S cpupower
sudo systemctl enable --now nvidia-powerd.service
sudo systemctl enable --now cpupower.service
sudo cpupower frequency-set -g performance
sudo pacman -S lib32-mesa-utils vulkan-tools

## CONFIGS

sudo grub-mkconfig -o /boot/grub/grub.cfg

## Tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Time Fix

sudo timedatectl set-timezone Asia/Kolkata -- if time not set

## Themes

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd then ./install.sh
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd then ./install.sh

# Do

-> TTY Font Change - sudo nvim /etc/vconsole.conf - Font=ter-d28b

-> GRUB Theme - Youtube - https://www.youtube.com/watch?v=jpiHEAYCMtQ or https://github.com/adi1090x/plymouth-themes

-> Reduce GRUB delay - sudo nvim /etc/default/grub - sudo grub-mkconfig -o /boot/grub/grub.cfg

-> set up lsp meson and treesitter - in nvim
