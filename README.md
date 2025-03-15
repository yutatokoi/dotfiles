# Dotfiles

## Files and directories

- `settings.json` is the settings file for VSCode/VSCodium
- `.config` includes the configuration settings for Neovim
- `config` file is the settings file for Ghostty terminal emulator. On macOS, the file belongs in `$HOME/Library/Application\ Support/com.mitchellh.ghostty/config`
- Shell prompt is customised with starship.rs
    - starship.rs can be installed with `brew install starship`
    - Configuration is done in `.config/starship.toml`

## Shells

Zsh customisation can be done, but it's cumbersome and I would prefer not to worry about it. By default, use Fish as the shell.

### Switching between shells on macOS

<https://www.cyberciti.biz/faq/change-default-shell-to-bash-on-macos-catalina/>

- `cat /etc/shells` to list installed shells
- `chsh -s /path/to/shell/to/change/to`
- Restart terminal
- The shell in use can be checked with `echo "$SHELL"`
