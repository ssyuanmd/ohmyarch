#!/bin/bash
install_neovim() {
cowsay "neovim"
git clone https://github.com/ssyuanmd/neovim ~/.config/nvim

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir ~/library

# lua
git clone https://github.com/sumneko/lua-language-server ~/library/lua-language-server
cd ~/library/lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# java
links https://download.eclipse.org/jdtls/milestones/1.9.0/
yay -Sy java-openjdk

exec bash
}
