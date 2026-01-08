# dotfiles

Personal dotfiles. Support for macOS and Linux devcontainer.

## Contents

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config with oh-my-zsh, spaceship prompt, plugins, aliases |
| `.gitconfig` | Git user settings and push behavior |
| `.config/ghostty/config` | Ghostty terminal settings |
| `.config/gh/config.yml` | GitHub CLI preferences |
| `install.sh` | Automated setup script for devcontainers |

## Devcontainer Usage

Add to your `~/.zshrc` on your host machine:

```bash
export DEVCONTAINER_DOTFILES_REPOSITORY="https://github.com/gortron/dotfiles"
```

The `install.sh` script will automatically:
- Install oh-my-zsh
- Install spaceship prompt
- Install zsh-autosuggestions and zsh-syntax-highlighting plugins
- Symlink all config files

## Manual Setup (New Mac)

```bash
# Clone to home directory
git clone https://github.com/gortron/dotfiles.git ~/dotfiles

# Run install script
cd ~/dotfiles && ./install.sh
