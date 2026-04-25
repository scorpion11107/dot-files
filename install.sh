## Apps ##
paru -S --noconfirm firefox discord spotify

## Gaming ##
sudo pacman -S --noconfirm cachyos-gaming-meta cachyos-gaming-applications
paru -S --noconfirm modrinth-app

## Dev ##
paru -S --noconfirm git zed

## Rust ##
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh # Rustup
sudo pacman -S --needed --noconfirm webkit2gtk-4.1 base-devel curl wget file openssl appmenu-gtk-module libappindicator-gtk3 librsvg xdotool # Tauri dependencies

## Update and cleanup ##
paru -R --noconfirm alacritty meld cachyos-micro-settings micro sushi evince
sudo pacman -Rsn $(pacman -Qdtq)
paru
