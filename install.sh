#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                      # dotfiles directory
olddir=~/dotfiles_old               # old dotfiles backup directory
vimtempfilesdir=~/vimtemp           # dir where vim will store backup, swp and undo files
files="bashrc vimrc vim tmux.conf"  # list of files/folders to symlink in homedir

##########

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Creating $vimtempfilesdir for storing temporary vim files ~"
mkdir -p $olddir
mkdir ~/vimtempfilesdir ~/vimtempfilesdir/.backup ~/vimtempfilesdir/.swp ~/vimtempfilesdir/.undo
echo "...done"

# Install Plug plugin manager for vim
echo "Installing Plug..."
curl -fLo ~/dotfiles/vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "...done"

# Install vim plugins
echo "Installing vim plugins"
vim +PlugInstall +qall
echo "...done"

echo "Getting git prompt and completion"
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.sh
echo "...done"

echo "Getting dircolors"
wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark -O ~/.dircolors
echo "..done"

echo "Installing tmuxp"
pip install --user tmuxp
echo "..done"

