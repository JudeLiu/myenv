#!/bin/bash

# compilers & interpreters
sudo apt-get install -y gcc clang

sudo apt-get install -y python-pip python3-pip

# ipython-notebook
sudo apt-get install -y ipython-notebook

# git configs
git config --global core.editor "'C:/Program Files/Sublime Text 2/sublime_text.exe' -n -w"
git config --global push.default upstream
git config --global merge.conflictstyle diff3

cat bash_profile_course >> ~/.bashrc