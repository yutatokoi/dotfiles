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

# Abbreviations
abbr --add dl cd ~/Downloads
abbr --add do cd ~/Documents
abbr --add pd cd $HOME/Library/CloudStorage/ProtonDrive-yutatokoi@proton.me-folder
abbr --add od cd $HOME/Library/CloudStorage/ProtonDrive-yutatokoi@proton.me-folder/obsidian

starship init fish | source
