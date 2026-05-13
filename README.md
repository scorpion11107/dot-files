**This project was made to easily install all the tools I need on CachyOS with KDE Plasma. Keep in minde that the script might not work if your setup is different than mine.**

## Installation

### Script
- Generte an SSH key by running `ssh-keygen -t ed25519 -C "your.email@example.com" -f ~/.ssh/id_ed25519 -N ""` (and register it on GitHub). The key can be retrieved by running `cat ~/.ssh/id_ed25519.pub`
- Create your git identity by running `git config --global user.name "Your Name"` and `git config --global user.email "your.email@example.com"`
- Clone the repo through SSH
- run the script using `cd dot-files && bash ./install.sh`
- Update your system by running `update` (you may need to reload your shell for the function to work)
- Reboot your system

### Apps
Set the default terminal to Zellij

### KDE Plasma settings

## Once installed
- Set your default terminal to Zellij
- Register the generated SSH key into github for automatic authentication
