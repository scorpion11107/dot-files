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
echo "Gaming apps:"
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
echo "fish"
silent rm -rf ~/.config/fish
silent mkdir -p ~/.config/fish
silent mkdir -p ~/.config/fish/functions
silent ln -sf "$(pwd)/config/fish/config.fish" ~/.config/fish/config.fish
silent ln -sf "$(pwd)/config/fish/functions/update.fish" ~/.config/fish/functions/update.fish
silent ln -sf "$(pwd)/config/fish/functions/install-repos.fish" ~/.config/fish/functions/install-repos.fish
echo "starship"
silent ln -sf "$(pwd)/config/starship.toml" ~/.config/starship.toml
echo "helix"
silent rm -rf ~/.config/helix
silent mkdir -p ~/.config/helix
silent ln -sf "$(pwd)/config/helix/config.toml" ~/.config/helix/config.toml
