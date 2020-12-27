#!/usr/bin/env bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/
ln -s ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/

nvim -c PlugInstall -c q -c q
