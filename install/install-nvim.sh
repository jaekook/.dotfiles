#!/bin/bash

# rm $VIMCONFIG/pluggedconf &>/dev/null
# rm $VIMCONFIG/ftplugin &>/dev/null


# Create all necessary folder for neovim
if [ ! -d $VIMCONFIG ]
  then
    mkdir $VIMCONFIG

    # install neovim plugin manager
    curl -fLo ~/.dotfiles/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# From Cloud
ln -sf "$DOTFILES_CLOUD/projects.nvimrc" "$VIMCONFIG"

# install vim session folder
mkdir -p "$VIMCONFIG/sessions"

# install nvim config
ln -sf "$DOTFILES/nvim/init.vim" "$VIMCONFIG"
ln -sf "$DOTFILES/nvim/init_plugins.vim" "$VIMCONFIG"

# Install all mandatory folders if they don't exist already
mkdir -p "$VIMCONFIG/plugged"
mkdir -p "$VIMCONFIG/backup"
mkdir -p "$VIMCONFIG/undo"
mkdir -p "$VIMCONFIG/swap"
mkdir -p "$VIMCONFIG/after"

# Install Godoctor for vim
if [ ! -d "$VIMCONFIG/godoctor.vim" ]
  then
    git clone "https://github.com/godoctor/godoctor.vim" "$VIMCONFIG/godoctor.vim"
fi

# If no projects configured create an empty file
if [ ! -f "$VIMCONFIG/projects.nvimrc" ]
  then
    touch "$VIMCONFIG/projects.nvimrc"
fi

# configuration of different plugins
ln -sf "$DOTFILES/nvim/pluggedconf" "$VIMCONFIG"

# configuration of coc
ln -sf "$DOTFILES/nvim/coc-settings.json" "$VIMCONFIG/coc-settings.json"

# color schemes
ln -sf "$DOTFILES/nvim/colors" "$VIMCONFIG"

# indentation
rm -rf "$VIMCONFIG/after/indent"
ln -sf "$DOTFILES/nvim/after/indent" "$VIMCONFIG/after"

# lua
rm -rf "$VIMCONFIG/lua"
ln -sf "$DOTFILES/nvim/lua" "$VIMCONFIG"

# snippets
rm -rf "$VIMCONFIG/UltiSnips"
ln -sf "$DOTFILES/nvim/UltiSnips" "$VIMCONFIG"

# :help ftplugin
ln -sf "$DOTFILES/nvim/ftplugin" "$VIMCONFIG"

# :help ftdetect
ln -sf "$DOTFILES/nvim/ftdetect" "$VIMCONFIG"

# :help autoload
ln -sf "$DOTFILES/nvim/autoload" "$VIMCONFIG"

# thesaurus
rm -rf "$VIMCONFIG/thesaurus"
ln -sf "$DOTFILES/nvim/thesaurus" "$VIMCONFIG"

# spell files
ln -sf "$DOTFILES/nvim/spell" "$VIMCONFIG"

# projects.nvimrc is installed from the cloud

# TODO crash when lightline pluggin is not installed...
# installing colorscheme for lightline
ln -sf "$DOTFILES/nvim/plugged/lightline.vim/colorscheme/hypnos256.vim" \
"$VIMCONFIG/plugged/lightline.vim/autoload/lightline/colorscheme/hypnos256.vim"
