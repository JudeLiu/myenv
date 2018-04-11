#!/bin/bash

# update sources.list
echo "Updating sources.list..."
sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
sudo cp sources.list /etc/apt/
sudo apt-get update
echo "done"

# install sublime text 3
echo "Installing Sublime Text 3..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
echo "done"

# compilers & interpreters
echo "Installing clang & python..."
sudo apt-get install -y gcc clang

sudo apt-get install -y python
sudo apt-get install -y python-pip python3-pip

echo "done"

# ipython-notebook
echo "Installing python libs..."
sudo apt-get install -y ipython-notebook
# numpy
sudo pip install numpy
sudo pip3 install numpy

echo "done"

# git configs
echo "Configuring git..." 
git config --global core.editor "subl"
git config --global push.default upstream
git config --global merge.conflictstyle diff3
git config --global user.email "ljnsjtu@hotmail.com"
git config --global user.name "liujunnan"
git config credential.helper 'cache --timeout=3600'

cp git-completion.bash ~/.git-completion.bash
cp git-prompt.sh ~/.git-prompt.sh
cat bash_profile_course >> ~/.bashrc
echo "done"
