#!/bin/bash


read -p "Update sources.list? [Y/n] " ans 
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    # update sources.list
    distro=`lsb_release -si`
    codename=`lsb_release -sc`
    if [ "$distro" = "Ubuntu" ]; then
        echo "Updating sources.list..."
        sed "s/bionic/${codename}/g" -i sources.list 
        sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
        sudo cp sources.list /etc/apt/
        sudo apt-get update
        echo "done"
    fi
fi

# git configs
echo "Configuring git..." 
sudo apt-get install git
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
    cp dotfiles/vimrc ~/.vimrc
    echo "Launch vim and run :PlugInstall"
fi

read -p "Install zsh? [Y/n] " ans
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    sudo apt-get install -y zsh
    sudo chsh -s $(which zsh)
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp dotfiles/zshrc ~/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone git://github.com/wting/autojump.git
    cd autojump && ./install.py
    echo >> ~/.bashrc
    echo "# set default shell as zsh" >> ~/.bashrc 
    echo "bash -c zsh" >> ~/.bashrc
fi

read -p "Install Miniconda? [Y/n] " ans 
if [ "$ans" = "" ] || [ "$ans" = "Y" ] || [ "$ans" = "y" ]; then
    # Fix matplotlib dependency
    # "libGl.so"
    sudo apt install -y libgl1-mesa-glx
    echo "plz manually download from https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
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
