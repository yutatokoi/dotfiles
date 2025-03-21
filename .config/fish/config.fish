if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (/opt/homebrew/bin/brew shellenv)
end

# Preferred editor for local and remote sessions
if test -n "$SSH_CONNECTION"
    set -x EDITOR 'vim'
else
    set -x EDITOR 'nvim'
end

# Navigate man pages with neovim
set -x MANPAGER 'nvim +Man!'

# Aliases
alias dl="cd ~/Downloads"
alias do="cd ~/Documents"
alias pd="cd $HOME/Library/CloudStorage/ProtonDrive-yutatokoi@proton.me-folder"

starship init fish | source

set -Ux PATH $HOME/.nix-profile/bin /run/current-system/sw/bin /nix/var/nix/profiles/default/bin $PATH
