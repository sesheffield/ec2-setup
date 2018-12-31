#!/bin/bash

echo "Starting setup"
PACKAGES=(
  go
  docker
)

echo "Installing packages..."
sudo yum -y install ${PACKAGES[@]}

echo "Start Docker Daemon"
chmod 666 /var/run/docker.sock
service docker start

echo "Installing neovim..."
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage $HOME/

echo "Installing VimPlug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Moving config files..."
mv .bashrc $HOME
mv .bash_profile $HOME
mv .config $HOME
source ~/.bashrc
source ~/.bash_profile

echo "Moving folder structure..."
cd $HOME
mkdir go && cd go && mkdir src && cd src && mkdir github.com && cd github.com
mv ../../../../home/ec2-user/sesheffield .


