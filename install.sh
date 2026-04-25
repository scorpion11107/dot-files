#!/bin/bash
set -e

## SYSTEM ##
paru -S --needed --noconfirm fish starship curl wget file openssl


## APPS ##
paru -S --needed --noconfirm firefox discord


## GAMING (CachyOS related) ##
paru -S --needed --noconfirm cachyos-gaming-meta cachyos-gaming-applications


## DEV ##
paru -S --needed --noconfirm zed vis

# Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y # Rustup
paru -S --needed --noconfirm webkit2gtk-4.1 base-devel appmenu-gtk-module libappindicator-gtk3 librsvg xdotool # Tauri dependencies


## AUR ##
paru -S --needed --noconfirm modrinth-app spotify


## CLEANUP (CachyOS related) ##
paru -Rcs --noconfirm alacritty evince meld micro vim zsh
orphans=$(pacman -Qdtq) && sudo pacman -Rsn --noconfirm $orphans
