#!/bin/bash
clear

if [ "$EUID" -eq 0 ]; then
    echo -e 'Do NOT execute this script as sudo/root.'
    exit
fi

echo -e 'Installing i3-wm and all necessary dependencies...\n'

sudo pacman -Sy i3-wm i3lock rofi git polybar picom feh alacritty --needed --noconfirm

while pgrep -x pacman > /dev/null; do sleep 1; done

if [ -d ~/creepy0964-dotfiles ]; then
    echo -e '\nDirectory exists. Removing...'
    rm -rf ~/creepy0964-dotfiles
fi

while pgrep -x rm > /dev/null; do sleep 1; done

git clone https://github.com/creepy0964/dotfiles ~/creepy0964-dotfiles

while pgrep -x git > /dev/null; do sleep 1; done

mkdir -p ~/.config/i3 && cp creepy0964-dotfiles/i3/config ~/.config/i3/config
mkdir -p ~/.config/polybar && cp creepy0964-dotfiles/polybar/config.ini ~/.config/polybar/config.ini
cp creepy0964-dotfiles/images/wallpaper3.png ~/Pictures
cp creepy0964-dotfiles/launch_polybar.sh ~/launch_polybar.sh
chmod +x ~/launch_polybar.sh

echo -e '\n\n\nDone. Now you can log out from your current DE/WM and log in into i3-wm.\n'
