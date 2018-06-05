#!/bin/bash

# update sources.list
echo "Updating sources.list..."
sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
sudo cp sources.list /etc/apt/
sudo apt-get update
echo "done"

# git configs
echo "Configuring git..." 
git config --global push.default upstream
git config --global merge.conflictstyle diff3
git config --global user.email "ljnsjtu@hotmail.com"
git config --global user.name "liujunnan"
git config credential.helper 'cache --timeout=3600'

cp git-completion.bash ~/.git-completion.bash
cp git-prompt.sh ~/.git-prompt.sh
cat bash_profile_course >> ~/.bashrc
echo "done"


# c++ compiler
echo "Installing clang..."
sudo apt-get install -y gcc clang
echo "done"

# setting default python version
echo "Setting the version control of python"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
# type `update-alternatives --config python` if you want to switch the default version of python
echo "done"


# install Anaconda
echo "Installing Anaconda"
wget -O https://repo.anaconda.com/archive/Anaconda3-5.1.0-Linux-x86_64.sh
Anaconda3-5.1.0-Linux-x86_64.sh

bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/

conda config --set show_channel_urls yes
echo "done"

# Fix matplotlib dependency
sudo apt install -y libgl1-mesa-glx

echo -ne "If you want to show GUI on Windows Linux Subsystem, download Xming from Internet, and type
touch ~/.config/matplotlib/matplotlibrc && echo backend: TkAgg
echo DISPLAY=localhost:0.0 >> ~/.bashrc"
