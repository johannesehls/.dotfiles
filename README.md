# .dotfiles

## Info

This repository contains my personal dotfiles for configuring my development environment. It’s not intended for public use or as a general-purpose setup, but feel free to browse around for inspiration or ideas.

These configs cover tools like `i3`, `Neovim`, `tmux`, and `Zathura`.

## Using GNU Stow to Manage Dotfiles

Follow these steps to use **GNU Stow** for managing your dotfiles.

### 1. Clone the Repository

First, clone the dotfiles repository to your home directory:

```bash
git clone https://github.com/johannesehls/.dotfiles ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install GNU Stow

If you don't have Stow installed, you can install it using the following commands:

```bash
On Arch-based systems:       sudo pacman -S stow
On Ubuntu/Debian:            sudo apt install stow
On macOS (using Homebrew):   brew install stow
```

### 3. Use Stow to Symlink Configs

To create symbolic links for your configurations, run the following commands for each directory (like nvim, i3, etc.):

```bash
stow <directory>
```

(E.g.: `stow nvim`.)

This will create symbolic links in your home directory, pointing to the corresponding dotfiles in the repository. For example:


```bash
    ~/.config/nvim → ~/.dotfiles/nvim/.config/nvim
    ~/.config/i3 → ~/.dotfiles/i3/.config/i3
    ~/.tmux.conf → ~/.dotfiles/tmux/.tmux.conf
```

(To verify use  `ls -l ~`.)

Alternatively, just run the install script from repository root which uses GNU stow to manage all the dotfiles: `./install`.

### 4. Remove Symlinks (if needed)

If you want to undo a symlink, use the -D flag with Stow:

```bash
stow -D <directory>
```

(E.g.: `stow -D nvim`.)

Alternatively, just run the install script with option `-D` from repository root which uses GNU stow to manage all the dotfiles: `./install -D`.
