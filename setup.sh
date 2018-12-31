#!/bin/bash

echo "Granting sudo"
sudo su

echo "Starting setup"
PACKAGES=(
  go
  docker
)

echo "Installing packages..."
yum -y install ${PACKAGES[@]}

echo "Start Docker Daemon"
chmod 666 /var/run/docker.sock
service docker start

echo "Installing neovim..."
yum -y install epel-release
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
yum -y install neovim

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
mv $HOME/sesheffield .


