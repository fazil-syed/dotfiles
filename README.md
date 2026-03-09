# Dotfiles

My personal dotfiles for Ubuntu with GNOME desktop.

## What's included

| Config | Tool |
|--------|------|
| `zsh/` | Zsh shell config |
| `tmux/` | Tmux config with resurrect, continuum, and session hooks |
| `nvim/` | Neovim config based on kickstart.nvim |
| `ghostty/` | Ghostty terminal config |
| `starship/` | Starship prompt config |
| `git/` | Git global config |
| `ssh/` | SSH config (no keys) |

## Installation

Clone the repo:
```bash
git clone https://github.com/fazil-syed/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

Run the install script:
```bash
./install.sh
```

## Manual steps after install

1. Install GNOME extensions:
   - [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)
   - [system-monitor-next](https://extensions.gnome.org/extension/3010/system-monitor-next/)
2. Install GSConnect Chrome extension: [fazil-syed/gs-connect-chrome](https://github.com/fazil-syed/gs-connect-chrome)
3. Open tmux and press `Ctrl+a` then `I` to install tmux plugins
4. Open nvim and run `:TSInstall lua` to install treesitter parsers
5. Set up Syncthing for Obsidian vault sync

## Dependencies

Installed automatically by `install.sh`:
- tmux, gjs, syncthing, stow, git, curl, gcc, make, cmake
- ghostty (snap)
- starship (curl)
- nvm + node
- neovim (built from source)
