#!/bin/bash

## INIT ##
clear
sudo -v
while true; do sudo -v; sleep 60; done &
SUDO_PID=$!

## HELPER FUNCTION ##
silent() {
    if ! "$@" > /dev/null 2>&1; then
        echo "✗ Command failed: $*" >&2
        echo "Clearing sudo cache..."
        kill $SUDO_PID
        exit 1
    fi
}

## DEPENDENCIES ##
echo "Updating system..."
silent sudo pacman -Syu --noconfirm
echo "Installing dependencies..."
silent sudo pacman -S --noconfirm --needed paru fish starship git wget curl eza

## DEV TOOLS ##
echo "Installing Rust toolchain..."
silent paru -S --noconfirm --needed rustup
silent rustup default stable
echo "Installing VSCode from the AUR..."
silent paru -S --noconfirm --needed visual-studio-code-bin

## APPS ##
echo "Installing Discord..."
silent paru -S --noconfirm --needed discord
echo "Installing Spotify from the AUR..."
silent paru -S --noconfirm --needed spotify

## GAMING APPS ##
echo "Installing Steam..."
silent paru -S --noconfirm --needed steam
echo "Installing Modrinth from the AUR..."
silent paru -S --noconfirm --needed modrinth-app

## CONFIG ##
echo "Backing up old config..."
silent cp -r ~/.config ~/.config.backup.$(date +%Y%m%d%H%M%S)
echo "Symlinking config files for:"
echo "fish"
silent mkdir -p ~/.config/fish
silent ln -sf "$(pwd)/config/fish/config.fish" ~/.config/fish/config.fish
echo "starship"
silent ln -sf "$(pwd)/config/starship.toml" ~/.config/starship.toml
echo "konsole"
silent mkdir -p ~/.local/share/konsole
silent ln -sf "$(pwd)/config/konsole/Dotfiles.profile" ~/.local/share/konsole/Dotfiles.profile
silent ln -sf "$(pwd)/config/konsole/CatppuccinMocha.colorscheme" ~/.local/share/konsole/CatppuccinMocha.colorscheme

## CLEANUP ##
echo "Removing orphan packages..."
ORPHANS=$(pacman -Qdtq)
if [ -n "$ORPHANS" ]; then
    silent sudo pacman -Rns --noconfirm $ORPHANS
else
    echo "No orphans found."
fi
echo "Clearing package cache..."
silent sudo pacman -Sc --noconfirm
echo "Clearing paru cache..."
silent paru -Sc --noconfirm
echo "Clearing sudo cache..."
kill $SUDO_PID

## WALLPAPERS ##
echo "Copying wallpapers..."
silent cp -r walls ~/Pictures

## SSH KEY ##
echo "Generating SSH key for GitHub..."
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "SSH key already exists, skipping generation."
else
    silent ssh-keygen -t ed25519 -C "github" -f ~/.ssh/id_ed25519 -N ""
fi
silent ssh-add ~/.ssh/id_ed25519
echo ""
echo "Add the following public key to your GitHub account:"
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
