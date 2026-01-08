#!/bin/bash
# Dotfiles install script for devcontainers
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install spaceship prompt if not present
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" ]; then
  echo "Installing spaceship prompt..."
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
  ln -sf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
fi

# Install zsh-autosuggestions if not present
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" --depth=1
fi

# Install zsh-syntax-highlighting if not present
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" --depth=1
fi

# Symlink dotfiles
echo "Symlinking dotfiles..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.zshrc.local" "$HOME/.zshrc.local"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# Symlink .config files
mkdir -p "$HOME/.config"

# Clean up broken symlinks in .config
find "$HOME/.config" -type l ! -exec test -e {} \; -delete 2>/dev/null || true

for config_dir in "$DOTFILES_DIR/.config"/*; do
  if [ -d "$config_dir" ]; then
    dir_name=$(basename "$config_dir")
    mkdir -p "$HOME/.config/$dir_name"
    for file in "$config_dir"/*; do
      if [ -f "$file" ]; then
        ln -sf "$file" "$HOME/.config/$dir_name/$(basename "$file")"
      fi
    done
  fi
done

# macOS-specific: Symlink Application Support configs
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Setting up macOS Application Support symlinks..."

  # VS Code settings
  VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
  if [ -d "$VSCODE_USER_DIR" ]; then
    ln -sf "$DOTFILES_DIR/.config/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
    echo "  Linked VS Code settings.json"
  fi

  # Ghostty config
  GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
  if [ -d "$GHOSTTY_DIR" ]; then
    ln -sf "$DOTFILES_DIR/.config/ghostty/config" "$GHOSTTY_DIR/config"
    echo "  Linked Ghostty config"
  fi
fi

echo "Dotfiles installed successfully!"
