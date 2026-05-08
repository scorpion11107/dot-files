# Installation

### Limitations
This script was made for Endeavour OS with KDE Plasma, so it may not work anywhere else

### Steps
- Clone the repo through SSH using `git@github.com:scorpion11107/dot-files.git`
- run the script using `cd dot-files && bash ./install.sh`
- (optional) Install the CachyOS repositories using `install-repos` (you may need to reload your shell for the function to work)
- Update your system by running `update` (you may need to reload your shell for the function to work)
- Reboot your system

### Followup
- Set your default terminal to Ghostty
- Set your git identity by running `git config --global user.email "you@example.com"` and `git config --global user.name "Your Name"`
- Register the generated SSH key into github for automatic authentication

# Documentation

### SSH Key
The script generates an SSH key for github. You can retrieve-it after running the scrit using `cat ~/.ssh/id_ed25519.pub`
