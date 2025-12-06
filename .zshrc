eval "$(starship init zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Aliases
alias dl="cd ~/Downloads"
alias do="cd ~/Documents"
alias pd="cd $HOME/Library/CloudStorage/ProtonDrive-yutatokoi@proton.me-folder"

export MANPAGER='nvim +Man!'
