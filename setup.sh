clear

copyFiles() {
    if [ ! -d /home/$USER/.config/i3/ ]; then
        echo -e "No i3 directory. Creating..."
        sudo mkdir -p /home/$USER/.config/i3
    fi
    if [ ! -d /home/$USER/.config/polybar/ ]; then
        echo -e "No polybar directory. Creating..."
        sudo mkdir -p /home/$USER/.config/polybar
    fi
    if [ ! -d /home/$USER/.config/picom/ ]; then
        echo -e "No picom directory. Creating..."
        sudo mkdir -p /home/$USER/.config/picom
    fi
    if [ ! -d /home/$USER/Pictures ]; then
        echo -e "No Pictures directory. Creating..."
        sudo mkdir -p /home/$USER/Pictures
    fi
    if [ ! -d /usr/local/share/fonts ]; then
        echo -e "No fonts directory. Creating..."
        sudo mkdir -p /usr/local/share/fonts
    fi
    read -p "PC or notebook? [p/n]: " device
    case $device in

        'P' | 'p')
            sudo cp ./pc/i3/* /home/$USER/.config/i3/
            sudo cp ./pc/polybar/* /home/$USER/.config/polybar/
            sudo cp ./pc/picom/* /home/$USER/.config/picom/
            sudo cp ./wallpaper3.png /home/$USER/Pictures/
            sudo cp ./UniNeueRegular.ttf /usr/local/share/fonts/
            ;;
        'N' | 'n')
            sudo cp ./notebook/i3/* /home/$USER/.config/i3/
            sudo cp ./notebook/polybar/* /home/$USER/.config/polybar/
            sudo cp ./notebook/picom/* /home/$USER/.config/picom/
            sudo cp ./wallpaper3.png /home/$USER/Pictures/
            sudo cp ./UniNeueRegular.ttf /usr/local/share/fonts/
            ;;
        *)
            echo 'Unknown input. Exiting...'
            exit 1
            ;; 
    esac
    sudo chown $USER /home/$USER/*
    sudo chmod +x /home/$USER/.config/i3/*
    echo -p "All done! Now you can login into i3wm."
}

installDeps() {
    read -p "Select your distro [Arch/Gentoo]: " distro
    case $distro in

        'Arch' | 'arch')
            sudo pacman -Sy i3-wm rofi polybar picom alacritty feh --needed --noconfirm
            copyFiles
            ;;
        'Gentoo' | 'gentoo')
            sudo emerge -q i3 rofi polybar picom alacritty feh setxkbmap xrandr
            copyFiles
            ;;
        *)
            echo 'Sorry, we cannot install dependencies now for your distro. :('
            ;; 
    esac
}

if [ $UID -eq 0 ]; then 
    echo -e 'Do not execute this script as superuser.'
    exit 1
fi

echo -e "Welcome to Creepy0964's dotfiles installation script!"
read -p 'Are the requirements satisfied? [y/N]: ' req

case $req in

    'y' | 'Y')
        copyFiles
        ;;
    'n' | 'N')
        installDeps
        ;;

    *)
        echo -e "Unknown input. Exiting..."
        exit 1
        ;;
esac
