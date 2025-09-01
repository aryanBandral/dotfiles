#!/usr/bin/env bash

# Exit on error
set -e

echo ">>> Updating system..."
sudo pacman -Syu --noconfirm

echo ">>> Installing core packages..."
sudo pacman -S --noconfirm --needed \
    base base-devel linux linux-firmware networkmanager efibootmgr git stow

echo ">>> Installing Hyprland + Wayland essentials..."
sudo pacman -S --noconfirm --needed \
    hyprland hyprpaper hyprlock hypridle sddm \
    xdg-desktop-portal xdg-desktop-portal-hyprland wl-clipboard wlogout \
    rofi-wayland waybar swaync grim slurp swappy kitty

echo ">>> Installing system utilities..."
sudo pacman -S --noconfirm --needed \
    pavucontrol pipewire pipewire-pulse wireplumber \
    brightnessctl playerctl thunar udiskie udisks2

echo ">>> Installing fonts & theming..."
sudo pacman -S --noconfirm --needed \
    ttf-jetbrains-mono-nerd papirus-icon-theme \
    catppuccin-cursors-mocha catppuccin-gtk-theme-mocha

echo ">>> Installing extras..."
sudo pacman -S --noconfirm --needed \
    fastfetch

echo ">>> Enabling services..."
sudo systemctl enable NetworkManager
sudo systemctl enable sddm

echo ">>> Done! Reboot the system to get everything running."
