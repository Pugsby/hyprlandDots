#!/usr/bin/env bash
echo ▗▄▄▖ ▗▖ ▗▖ ▗▄▄▖ ▗▄▄▖▗▄▄▖▗▖  ▗▖▗▖    ▗▄▖ ▗▖  ▗▖▗▄▄▄
echo ▐▌ ▐▌▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▝▚▞▘ ▐▌   ▐▌ ▐▌▐▛▚▖▐▌▐▌  █
echo ▐▛▀▘ ▐▌ ▐▌▐▌▝▜▌ ▝▀▚▖▐▛▀▚▖ ▐▌  ▐▌   ▐▛▀▜▌▐▌ ▝▜▌▐▌  █
echo ▐▌   ▝▚▄▞▘▝▚▄▞▘▗▄▄▞▘▐▙▄▞▘ ▐▌  ▐▙▄▄▖▐▌ ▐▌▐▌  ▐▌▐▙▄▄▀
echo Pugsby\'s hyprland dotfiles
echo ====================================================
echo Some commands may use sudo, you will have to use your password around 5 times total

read -p "Are you sure you want to install Pugsbyland? You can find your original dotfiles in $HOME/.pugsbylandBackup/ [Y/n]" -n 1 -r
cd "$(dirname "${BASH_SOURCE[0]}")"
if [[ $REPLY =~ ^[Nn]$ ]]
then
    exit
fi

mkdir -p $HOME/.pugsbylandBackup
sudo pacman -S --needed hyprland hypridle hyprlock quickshell base-devel git flatpak nemo hyprshot kitty nemo fish starship uwmm playerctl alsa-utils pipewire-tools mako polkit --noconfirm
if command -v yay &> /dev/null; then
    echo "yayyyyy :D"
else
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf ./yay
fi
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive --system flathub org.waywallen.waywallen # For whatever reason, waywallen gui's newest version doesn't work due to libjxl (even though waywallen doesn't even use jxl) so I have to use flatpaks
yay -S waywallen-layer-shell --noconfirm
tocopy=("fish/" "fuzzel/" "hypr/" "kitty/" "quickshell/" "starship.toml")
for object in "${tocopy[@]}"; do
    echo "Processing: $object"

    if [ -e "$HOME/.config/$object" ]; then
        if [ -d "$HOME/.config/$object" ]; then
            rm -rf "$HOME/.pugsbylandBackup/$object"
        fi
        mv -f "$HOME/.config/$object" "$HOME/.pugsbylandBackup/"
    fi

    if [ -e "./config/$object" ]; then
        if [[ "$object" == *"/" ]]; then
            mkdir -p "$HOME/.config"
            cp -r "./config/$object" "$HOME/.config/"
        else
            mkdir -p "$HOME/.config"
            cp "./config/$object" "$HOME/.config/"
        fi
    else
        echo "Warning: ./config/$object not found in the current directory."
    fi
done
systemctl --user enable --now mako


echo Done! You can either reboot your computer or start hyprland to check if everything was correctly installed.
echo =================================
echo            Keybinds:
echo Super + Return     Kitty/Terminal
echo Ctrl+Alt+T         Kitty/Terminal
echo Super + F11          Toggle Float
echo Super + L                    Lock
echo Super + E     File Manager / Nemo
echo Print Screen           Screenshot
echo Alt+F4       Close current window
echo Super           App Menu / Fuzzel
echo Super+Arrow        Move Selection
echo Super+[Number]        Change Desk
echo Super+Scroll          Change Desk
echo =================================
echo Open waywallen to change your wallpaper.