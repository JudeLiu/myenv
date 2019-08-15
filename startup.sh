#!/bin/bash

# git configs
echo "Configuring git..." 
git config --global core.editor vim
git config --global push.default upstream
git config --global merge.conflictstyle diff3
git config --global user.email "liujunnan@sjtu.edu.com"
git config --global user.name "Liu Junnan"
git config credential.helper 'cache --timeout=7200'

read -p "Install vim plugins? [Y/n] " ans
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then

    # Install vim plugins
    echo "Install Vim plugins"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp vimrc ~/.vimrc
    echo "Launch vim and run :PlugInstall"
fi

read -p "Install zsh? [Y/n] " ans
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp dotfiles/zshrc ~/.zshrc
fi

read -p "Sudo permission? [Y/n] " ans 
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    # update sources.list
    echo "Updating sources.list..."
    sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
    sudo cp sources.list /etc/apt/
    sudo apt-get update
    echo "done"
fi

read -p "Install Miniconda? [Y/n] " ans 
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    # Fix matplotlib dependency
    # "libGl.so"
    sudo apt install -y libgl1-mesa-glx

    echo -e "If you want to show GUI on Windows Linux Subsystem, download Xming on Internet, and type
    touch ~/.config/matplotlib/matplotlibrc && echo \"backend: TkAgg\" >> ~/.config/matplotlib/matplotlibrc
    echo DISPLAY=localhost:0.0 >> ~/.bashrc"
fi

read -p "Install Matplotlib in WSL? [Y/n] " ans 
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    echo "Install Miniconda"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    Miniconda3-latest-Linux-x86_64.sh
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
    
    conda config --set show_channel_urls yes
    echo "Done"

fi

cp dotfiles/bash_aliases ~/.bash_aliases
