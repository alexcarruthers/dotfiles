#!/bin/bash

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

SCRIPT_DIR=`dirname "$0"`

echo "Copying rc files"
cp $SCRIPT_DIR/.zshrc ~/.zshrc
cp $SCRIPT_DIR/.psqlrc ~/.psqlrc

echo "Copying vim configs"
mkdir -p ~/.config/nvim/
cp -r $SCRIPT_DIR/config/nvim ~/.config/

echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing plugins"
nvim --noplugin --headless -c 'PlugInstall' -c 'qa'
