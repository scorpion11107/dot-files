## SYSTEM ##
paru -S foot fish starship curl wget file openssl


## APPS ##
paru -S --noconfirm firefox discord


## GAMING (CachyOS related) ##
paru -S --noconfirm cachyos-gaming-meta cachyos-gaming-applications


## DEV ##
paru -S --noconfirm zed neovim

# Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh # Rustup
sudo pacman -S --needed --noconfirm webkit2gtk-4.1 base-devel appmenu-gtk-module libappindicator-gtk3 librsvg xdotool # Tauri dependencies


## AUR ##
paru -S --noconfirm modrinth-app spotify


## CLEANUP (CachyOS related) ##
paru -Rcs --noconfirm micro
paru -Rcs --noconfirm evince
paru -Rcs --noconfirm zsh
paru -R --noconfirm alacritty meld vim
sudo pacman -Rsn $(pacman -Qdtq)
