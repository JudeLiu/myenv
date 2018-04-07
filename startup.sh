#!/bin/bash

# install sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# compilers & interpreters
sudo apt-get install -y gcc clang

sudo apt-get install -y python-pip python3-pip

# ipython-notebook
sudo apt-get install -y ipython-notebook

# git configs
git config --global core.editor "subl -n -w"
git config --global push.default upstream
git config --global merge.conflictstyle diff3
git config --global user.email "ljnsjtu@hotmail.com"
git config --global user.name "liujunnan"
git config credential.helper 'cache --timeout=3600'

cp git-completion.bash ~/.git-completion.bash
cp git-prompt.sh ~/.git-prompt.sh
cat bash_profile_course >> ~/.bashrc
