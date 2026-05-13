## HELPER FUNCTION ##
silent() {
    if ! "$@" > /dev/null 2>&1; then
        echo "✗ Command failed: $*" >&2
        exit 1
    fi
}

## INIT ##
clear
sudo -v

echo "Updating system"
silent paru -Syu --noconfirm

## GENERAL APPS ##
echo
echo "General apps:"
echo "Installing Discord"
silent paru -S --noconfirm --needed discord
echo "Installing Spotify"
silent paru -S --noconfirm --needed spotify

## GAMING APPS ##
echo
echo "Gaming tweaks and apps:"
echo "Installing CachyOS meta-packages"
silent paru -S --noconfirm --needed cachyos-gaming-meta cachyos-gaming-applications
echo "Installing ProtonUp QT"
silent paru -S --noconfirm --needed protonup-qt
echo "Installing CurseForge"
silent paru -S --noconfirm --needed curseforge

## DEV TOOLS ##
echo
echo "Dev tools:"
echo "Installing Helix"
silent paru -S --noconfirm --needed helix
echo "Installing Rust toolchain"
silent paru -S --noconfirm --needed rustup
silent rustup default stable

## CONFIG ##
echo
echo "Configurations:"
echo "Backing up old config"
silent cp -r ~/.config ~/.config.backup.$(date +%Y%m%d%H%M%S)
echo "Symlinking config files for:"
echo "helix"
silent rm -rf ~/.config/helix
silent mkdir -p ~/.config/helix
silent ln -sf "$(pwd)/config/helix/config.toml" ~/.config/helix/config.toml
