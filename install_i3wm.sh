#!/bin/bash
clear

workdir = "~/creepy0964-dotfiles"
i3 = "~/.config/i3"
polybar = "~/.config/polybar"
picom = "~/.config/picom"

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

git clone https://github.com/creepy0964/dotfiles $workdir

while pgrep -x git > /dev/null; do sleep 1; done

if ! [ -d ~/.config/i3 ]; then
    echo -e '\nNo i3 directory. Creating...'
    mkdir -p ~/.config/i3
fi

if ! [ -d ~/.config/polybar ]; then
    echo -e '\nNo polybar directory. Creating...'
    mkdir -p ~/.config/polybar
fi

if ! [ -d ~/.config/picom ]; then
    echo -e '\nNo picom directory. Creating...'
    mkdir -p ~/.config/picom
fi

cp $workdir/config/i3/config $i3/config
cp $workdir/config/polybar/config.ini $polybar/config.ini
cp $workdir/config/picom/picom.conf $picom/picom.conf
cp $workdir/images/wallpaper3.png ~/Pictures/wallpaper3.png
cp $workdir/launch_polybar.sh $polybar/launch_polybar.sh
chmod +x $polybar/launch_polybar.sh

echo -e '\n\n\nDone. Now you can log out from your current DE/WM and log in into i3-wm.\n'
