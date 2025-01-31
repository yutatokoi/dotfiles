# OMZ
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
HIST_STAMPS="yyyy-mm-dd"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Aliases
alias dl="$HOME/Downloads"
alias do="$HOME/Documents"
alias pd="$HOME/Library/CloudStorage/ProtonDrive-yutatokoi@proton.me-folder"

. "$HOME/.local/bin/env"
eval "$(~/.local/bin/mise activate)"

export MANPAGER='nvim +Man!'
