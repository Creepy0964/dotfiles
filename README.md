# dotfiles
just my dotfiles for i3wm

# prerequisites
- `alacritty`
- `i3wm`
- `picom`
- `polybar`
- `rofi`
- `fontconfig`
- `git`
- `curl`
- any display manager (i prefer `sddm`)
- `zsh`, `oh-my-zsh` and some plugins

# automatical installation
NOTE: only for arch and arch-based distros

```bash
python install_script.py
python zsh_plugins.py
```

after that, log out and log in or start sddm

# manual installation
- install all prerequisites
- install all plugins from [here](#plugins)
- copy all directories except `fonts` to $HOME/.config/
- copy `wallpaper_arch.png` to $HOME/Pictures/
- copy all fonts from `./fonts` to /usr/local/share/fonts/
- copy `.zshrc` to $HOME/

after that, log out and log in or enable/start your display manager

# example
![alacritty](alacritty.jpg)
![desktop](desktop.jpg)

# plugins
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/tom-auger/cmdtime ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/cmdtime
```

# todo
- [ ] more fancy wallpapers (different distros, some pixel arts maybe)
- [ ] hyprland edition
- [X] install script (wow, i really did it :p)
- [ ] some apps themes (`nvim`, `telegram-desktop` etc.)
