#!/bin/bash
install_neovim() {
cowsay "neovim"
yes | yay -Sy nvim-packer-git
git clone https://github.com/ssyuanmd/neovim ~/.config/nvim

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir ~/library

# lua
git clone https://github.com/sumneko/lua-language-server ~/library/lua-language-server
cd ~/.config/lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# java
git clone https://github.com/eclipse/eclipse.jdt.ls ~/library

exec bash
}
