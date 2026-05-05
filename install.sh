#!/bin/bash

## INIT ##
clear
sudo -v

## HELPER FUNCTION ##
silent() {
    if ! "$@" > /dev/null 2>&1; then
        echo "✗ Command failed: $*" >&2
        exit 1
    fi
}

## DEPENDENCIES ##
echo "Updating system"
silent sudo pacman -Syu --noconfirm
echo "Installing paru"
silent sudo pacman -S --noconfirm --needed paru

## DEV TOOLS ##
echo "Installing terminal tools"
silent paru -S --noconfirm --needed ghostty fish starship eza wget curl fastfetch
echo "Configuring default shell"
silent sudo chsh -s $(which fish)
echo "Installing NeoVim with LazyVim"
silent paru -S --noconfirm --needed neovim
silent git clone https://github.com/LazyVim/starter ~/.config/nvim
echo "Installing VSCode"
silent paru -S --noconfirm --needed visual-studio-code-bin
echo "Installing Rust toolchain"
silent paru -S --noconfirm --needed rustup
silent rustup default stable

## APPS ##
echo "Installing Discord"
silent paru -S --noconfirm --needed discord
echo "Installing Spotify"
silent paru -S --noconfirm --needed spotify
echo "Installing Steam"
silent paru -S --noconfirm --needed steam
echo "Installing CurseForge"
silent paru -S --noconfirm --needed curseforge

## CONFIG ##
echo "Backing up old config"
silent cp -r ~/.config ~/.config.backup.$(date +%Y%m%d%H%M%S)
echo "Symlinking config files for:"
echo "ghostty"
silent mkdir -p ~/.config/ghostty
silent ln -sf "$(pwd)/config/ghostty/config" ~/.config/ghostty/config
echo "fish"
silent mkdir -p ~/.config/fish
silent mkdir -p ~/.config/fish/functions
silent ln -sf "$(pwd)/config/fish/config.fish" ~/.config/fish/config.fish
silent ln -sf "$(pwd)/config/fish/functions/update.fish" ~/.config/fish/functions/update.fish
echo "starship"
silent ln -sf "$(pwd)/config/starship.toml" ~/.config/starship.toml

## SSH KEY ##
echo "Generating SSH key for GitHub"
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "SSH key already exists, skipping"
else
    silent ssh-keygen -t ed25519 -C "github" -f ~/.ssh/id_ed25519 -N ""
    silent ssh-add ~/.ssh/id_ed25519
fi
echo "Add the following public key to your GitHub account:"
cat ~/.ssh/id_ed25519.pub
