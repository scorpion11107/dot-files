## Apps ##
paru -S firefox discord spotify

## Gaming ##
paru -S steam modrinth-app
sudo pacman -S cachyos-gaming-meta

## Dev ##
paru -S git zed

## Rust ##
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh # Rustup
sudo pacman -S --needed webkit2gtk-4.1 base-devel curl wget file openssl appmenu-gtk-module libappindicator-gtk3 librsvg xdotool # Tauri dependencies
