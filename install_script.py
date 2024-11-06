import os
import subprocess as s

os.system("clear")

print(f"welcome to my dotfiles installation script!\n\nif you are already have x11 on your machine, press Y. otherwise, press N: ")

packages_list = ""
dirs = ["i3", "alacritty", "picom", "polybar", "rofi", "fontconfig"]

x11 = input()

match x11:
    case "Y" | "y":
        packages_list = "i3-wm alacritty picom polybar feh fontconfig rofi zsh git curl"
    case "N" | "n":
        packages_list = "sddm i3-wm alacritty picom polybar feh fontconfig rofi zsh git curl"
    case _:
        print("unrecognised input. exiting...")
        exit()


os_name = os.popen("cat /etc/os-release | grep NAME=").read()

if "Arch" in os_name:
    print("\narch is installed. running pacman...\n")
    os.system(f"sudo pacman -Sy {packages_list}")

    os.system("mkdir -p $HOME/.config")

    for d in dirs:
        os.system(f"cp -r {d} $HOME/.config/")

    os.system("cp .zshrc $HOME/.zshrc")

    os.system("chsh -s /bin/zsh")

    if "sddm" in packages_list:
        os.system("sudo systemctl enable sddm")

    os.system("mkdir -p $HOME/Pictures")
    os.system("cp wallpaper_city.jpg $HOME/Pictures")

    os.system("sudo mkdir -p /usr/local/share/fonts")
    fonts = os.listdir("./fonts")

    for f in fonts:
        os.system(f"sudo cp ./fonts/{f} /usr/local/share/fonts")

    print("installed successfully!\n")

    sddm = os.popen("sudo systemctl status sddm | grep running")

    if "running" in sddm:
        print("log out from your current DE/WM and log in into i3, all should be set. enjoy!")
    else:
        print('execute "sudo systemctl start sddm" and log in into i3, all should be set. enjoy!')

    print("finalizing and installing oh-my-zsh...")

    os.system('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')

    exit()
    
else:
    print("\nsorry, but your distro isn't supported by now. please refer to README.md and use manual method :(")
    exit()
