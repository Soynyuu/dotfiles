#!/bin/zsh

# --- 1. Path Setup ---
DOTFILES_DIR=$HOME/dotfiles
export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

# --- 2. Create Dirs ---
mkdir -p $DOTFILES_DIR/terminal/themes
mkdir -p $DOTFILES_DIR/shell
mkdir -p $DOTFILES_DIR/vscode

echo "🚀 Backup started..."

# --- 3. Collection ---
brew bundle dump --force --file=$DOTFILES_DIR/Brewfile > /dev/null 2>&1
ls -1 /Applications > $DOTFILES_DIR/Applications_manual_list.txt

if command -v cursor &> /dev/null; then
    cursor --list-extensions > $DOTFILES_DIR/vscode/extensions.txt
elif command -v code &> /dev/null; then
    code --list-extensions > $DOTFILES_DIR/vscode/extensions.txt
fi

# --- 4. Copy Configs ---
cp ~/.zshrc $DOTFILES_DIR/shell/.zshrc
cp ~/.config/starship.toml $DOTFILES_DIR/shell/starship.toml
cp "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty" $DOTFILES_DIR/terminal/config.ghostty
cp -r ~/.config/ghostty/themes/* $DOTFILES_DIR/terminal/themes/

# --- 5. Git Sync ---
cd $DOTFILES_DIR
git add .
if ! git diff --cached --quiet; then
    git commit -m "Update: $(date +'%Y-%m-%d %H:%M:%S')" > /dev/null
    git push origin main > /dev/null 2>&1
fi
