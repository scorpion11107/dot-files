#!/bin/bash
set -e


## SYSTEM ##
sudo apt install -y fish curl wget unzip eza
chsh -s $(which fish)

# Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# JetBrains Nerd Font
echo "installing JetBrains nerd font"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
sudo unzip -q JetBrainsMono.zip -d /usr/local/share/fonts/JetBrainsMono
sudo fc-cache -f
rm JetBrainsMono.zip

# Starship
cargo install starship --locked


## APPS ##
sudo apt install -y firefox steam

# Flatpaks
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.modrinth.ModrinthApp
flatpak install -y flathub com.spotify.Client


## DEV ##
sudo apt install -y neovim

# VSCodium — add the official apt repository
wget -qO- https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
  | gpg --dearmor \
  | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] \
  https://download.vscodium.com/debs vscodium main" \
  | sudo tee /etc/apt/sources.list.d/vscodium.list > /dev/null
sudo apt update && sudo apt install -y codium

# Tauri
sudo apt install -y libwebkit2gtk-4.1-dev \
  build-essential \
  file \
  libxdo-dev \
  libssl-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev
cargo install create-tauri-app --locked


## CLEANUP ##
sudo apt autoremove -y
sudo apt update && sudo apt upgrade -y
