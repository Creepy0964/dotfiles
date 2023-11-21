#!/bin/bash
clear

workdir="$HOME/creepy0964-dotfiles"
i3="$XDG_CONFIG_HOME/.config/i3"
polybar="$XDG_CONFIG_HOME/.config/polybar"
picom="$XDG_CONFIG_HOME/.config/picom"

i3_conf="/config"
polybar_conf="/config.ini"
picom_conf="/picom.conf"

if [ "$EUID" -eq 0 ]; then
    echo -e 'Do NOT execute this script as sudo/root.'
    exit
fi

echo -e 'Installing i3-wm and all necessary dependencies...\n'

sudo pacman -Sy i3-wm i3lock rofi git polybar picom feh alacritty --needed --noconfirm

while pgrep -x pacman > /dev/null; do sleep 1; done

if [ -d $workdir ]; then
    echo -e '\nDirectory exists. Removing...'
    rm -rf $workdir
fi

while pgrep -x rm > /dev/null; do sleep 1; done

git clone https://github.com/creepy0964/dotfiles $workdir

while pgrep -x git > /dev/null; do sleep 1; done

if ! [ -d $i3 ]; then
    echo -e '\nNo i3 directory. Creating...'
    mkdir -p $i3
fi

if ! [ -d $polybar ]; then
    echo -e '\nNo polybar directory. Creating...'
    mkdir -p $polybar
fi

if ! [ -d $picom ]; then
    echo -e '\nNo picom directory. Creating...'
    mkdir -p $picom
fi

if ! [ -d $HOME/Pictures ]; then
    echo -e '\nNo Pictures directory. Creating...'
    mkdir -p $HOME/Pictures
fi

cp $workdir/config/i3/config "$i3$i3_conf"
cp $workdir/config/polybar/config.ini "$polybar$polybar_conf"
cp $workdir/config/picom/picom.conf "$picom$picom_conf"
cp $workdir/images/wallpaper3.png $HOME/Pictures/wallpaper3.png
cp $workdir/launch_polybar.sh "$polybar/launch_polybar.sh"
chmod +x "$polybar/launch_polybar.sh"

echo -e '\n\n\nDone. Now you can log out from your current DE/WM and log in into i3-wm.\n'
