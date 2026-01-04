# dotfiles

Personal dotfiles for macOS.

## Contents

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config with oh-my-zsh, spaceship prompt, plugins, aliases |
| `.gitconfig` | Git user settings and push behavior |
| `.macos` | macOS system preferences script |
| `.config/ghostty/config` | Ghostty terminal settings |
| `.config/gh/config.yml` | GitHub CLI preferences |

## Quick Setup (New Mac)

```bash
# Clone to home directory
git clone https://github.com/gortron/dotfiles.git ~/dotfiles

# Symlink configs
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
mkdir -p ~/.config && ln -sf ~/dotfiles/.config/* ~/.config/

# Run macOS preferences (optional)
chmod +x ~/dotfiles/.macos && ~/dotfiles/.macos
```

## Dependencies

The `.zshrc` expects these to be installed:

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Spaceship prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
  "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
  "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Plugins (via Homebrew on macOS)
brew install zsh-syntax-highlighting zsh-autosuggestions
```
