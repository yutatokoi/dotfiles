# Dotfiles

## Files and directories

- `settings.json` is the settings file for VSCode/VSCodium
- `.config` includes the configuration settings for Neovim
- `config` file is the settings file for Ghostty terminal emulator. On macOS, the file belongs in `$HOME/Library/Application\ Support/com.mitchellh.ghostty/config`
- Shell prompt is customised with starship.rs
    - starship.rs can be installed with `brew install starship`
    - Configuration is done in `.config/starship.toml`
- `flake.nix` is the configuration for macOS using Nix and `nix-darwin`. To use:
    - Install Nix
    - Install `nix-darwin`
    - Place the `flake.nix` inside of `/etc/nix-darwin/` (this seems to change, so follow the latest instructions)
    - `System Settings > Privacy & Security > Full Disk Access`. Give full disk access to your terminal to be able to configure the `system.defaults.universalaccess.*` settings
    - Enable the configuration with `darwin-rebuild switch`

## Shells

Zsh customisation can be done, but it's cumbersome and I would prefer not to worry about it. By default, use Fish as the shell. However, some commands may not work with Fish, such as `nix-shell`.

If you are having trouble converting from `zsh` to `fish`, one way to resolve may be:
```
# Find where fish is installed to
> which fish
/run/current-system/sw/bin/fish

# If `cat /etc/shells` doesn't show that directory above, then add it:
> sudo vim /etc/shells

# Restart terminal and do `chsh` to change shells.
```

### Switching between shells on macOS

<https://www.cyberciti.biz/faq/change-default-shell-to-bash-on-macos-catalina/>

- `cat /etc/shells` to list installed shells
- `chsh -s /path/to/shell/to/change/to`
- Restart terminal
- The shell in use can be checked with `echo "$SHELL"`
