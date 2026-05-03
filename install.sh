#!/bin/bash

## HELPER FUNCTION ##
silent() {
    if ! "$@" > /dev/null 2>&1; then
        echo "✗ Command failed: $*" >&2
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
silent paru -S --noconfirm --needed modrinth


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


## WALLPAPERS ##
echo "Copying wallpapers..."
cp walls ~/Pictures
