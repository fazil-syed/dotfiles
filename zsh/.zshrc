# ==============================
# Zsh configuration (clean)
# ==============================

# ------------------------------
# History (upgraded from defaults)
# ------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# ------------------------------
# Keybindings
# ------------------------------
bindkey -e

# ------------------------------
# Completion system (cached)
# ------------------------------
autoload -Uz compinit
if [[ ! -d ~/.zcompdump || ~/.zshrc -nt ~/.zcompdump ]]; then
  compinit
else
  compinit -C
fi

# ------------------------------
# Aliases
# ------------------------------
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias d='cd /mnt/D'
alias e='cd /mnt/E'
alias f='cd /mnt/F'
alias g='cd /mnt/G'

alias v='xclip -o -selection clipboard'
alias c='xclip -selection clipboard'

# ------------------------------
# Environment
# ------------------------------
export PATH="$PATH:/home/syed-fazil/.local/bin"

# Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# tmux TERM fix
if [[ -n "$TMUX" ]]; then
  export TERM=tmux-256color
fi

# ------------------------------
# Starship prompt
# ------------------------------
eval "$(starship init zsh)"


# ------------------------------
# Autosuggestions
# ------------------------------
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH=$PATH:$HOME/Downloads/platform-tools

# opencode
export PATH=/home/syed-fazil/.opencode/bin:$PATH

# tmux override so that tmux with no args doesn't create empty sessions  and with args works as usual
tmux() {
  if [ $# -eq 0 ]; then
    command tmux attach 2>/dev/null || command tmux new -s main
  else
    command tmux "$@"
  fi
}

# alias for neovim
alias vi='nvim'
alias vim='nvim'
