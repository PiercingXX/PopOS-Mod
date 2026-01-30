#!/bin/bash
# https://github.com/PiercingXX

username=$(id -u -n 1000)
builddir=$(pwd)


# Create Directories if needed
    # font directory
        if [ ! -d "$HOME/.fonts" ]; then
            mkdir -p "$HOME/.fonts"
        fi
        chown -R "$username":"$username" "$HOME"/.fonts
    # config directory
        if [ ! -d "$HOME/.config" ]; then
            mkdir -p /home/"$username"/.config
        fi
        chown -R "$username":"$username" /home/"$username"/.config
    # icons directory
        if [ ! -d "$HOME/.icons" ]; then
            mkdir -p /home/"$username"/.icons
        fi
        chown -R "$username":"$username" /home/"$username"/.icons
    # Background and Profile Image Directories
        if [ ! -d "$HOME/$username/Pictures/backgrounds" ]; then
            mkdir -p /home/"$username"/Pictures/backgrounds
        fi
        chown -R "$username":"$username" /home/"$username"/Pictures/backgrounds
        if [ ! -d "$HOME/$username/Pictures/profile-image" ]; then
            mkdir -p /home/"$username"/Pictures/profile-image
        fi
        chown -R "$username":"$username" /home/"$username"/Pictures/profile-image

# Update System
    echo -e "${YELLOW}Updating System...${NC}"  
        sudo apt update && sudo apt upgrade -y || true
        wait
        sudo apt full-upgrade -y
        wait
        sudo apt install -f
        wait
        sudo dpkg --configure -a
        sudo apt --fix-broken install -y
        wait
        sudo apt autoremove -y
        sudo apt update && sudo apt upgrade -y || true
    # Check if nala is installed
        if ! command_exists nala; then
            echo "nala is not installed. Installing now..."
            sudo apt install nala -y
        fi
        wait
    # Install flatpak
        sudo apt install flatpak -y
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        wait
#        flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
        flatpak update -y
    wait

# Install dependencies
    sudo apt install wget gpg zip unzip gzip tar make curl gcc gettext -y
    sudo apt install build-essential -y
    sudo apt install linux-firmware -y
    sudo apt install pipx -y
    sudo apt install jq -y
    sudo apt install trash-cli -y
    sudo apt install kitty -y
    sudo apt install mpv -y
    sudo apt install tmux -y
    sudo apt install sshpass -y
    sudo apt install htop -y

# Extras for yazi
    sudo apt install ffmpeg p7zip-full poppler-utils fd-find ripgrep fzf zoxide -y
    # Fix zoxide data directory permissions
    sudo mkdir -p /home/"$username"/.local/share/zoxide
    sudo chown -R "$username":"$username" /home/"$username"/.local/share/zoxide

# Installing fonts
    echo "Installing Fonts"
    cd "$builddir" || exit
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip
    unzip FiraCode.zip -d /home/"$username"/.fonts
    unzip Meslo.zip -d /home/"$username"/.fonts
    unzip NerdFontsSymbolsOnly.zip -d /home/"$username"/.fonts
    sudo rm FiraCode.zip Meslo.zip NerdFontsSymbolsOnly.zip
    sudo apt install fonts-font-awesome fonts-noto-color-emoji -y
    sudo apt install fonts-terminus -y
# Reload Font
    fc-cache -vf
    wait

# Install Gum
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt update && sudo apt install gum

# Overkill is underrated 
    sudo apt update && sudo apt upgrade -y || true
    wait
    sudo apt full-upgrade -y
    wait
    sudo apt install -f
    wait
    sudo dpkg --configure -a
    sudo apt --fix-broken install -y
    wait
    sudo apt autoremove -y
    sudo apt update && sudo apt upgrade -y || true
    wait
    flatpak update -y
