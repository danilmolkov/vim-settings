#!/usr/bin/bash

__install_colorsheme() {
    echo "> Install ${2}"
    curl -fLo ~/.vim/colors/${2}.vim --create-dirs ${1} 2> /dev/null
}

vim_install_colorshemes() {
    echo '> Install color schemes'
    __install_colorsheme https://raw.githubusercontent.com/tomasr/molokai/refs/heads/master/colors/molokai.vim molokai
    __install_colorsheme https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim jellybeans
    __install_colorsheme https://raw.githubusercontent.com/vim/colorschemes/refs/heads/master/colors/wildcharm.vim wildcharm
}

vim_install_plug() {
    echo '> Download pluging manager'
    curl -fLO ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 2> /dev/null
    echo '> Install plugins'
    vim +PlugInstall +qall
}

install() {
    local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    local SETTINGS_PATH="${SCRIPT_DIR}/settings"
    # Check if Neovim is installed
    if command -v nvim &> /dev/null; then
        echo '> Neovim is found'
        local NVIM_CONFIG_DIR="${HOME}/.config/nvim"
        # Ensure Neovim's config directory exists
        mkdir -p "$NVIM_CONFIG_DIR"
        # Copy .vimrc to Neovim's init.vimi
        echo "Copying ${SETTINGS_PATH} to ${NVIM_CONFIG_DIR}/init.vim"
        cp -i "${SETTINGS_PATH}" "${NVIM_CONFIG_DIR}/init.vim"
    elif command -v vim &> /dev/null; then
        echo '> Vim is found'
        echo "> Copying from ${SETTINGS_PATH} to ${HOME}/.vimrc"
        cp -i ${SETTINGS_PATH} "${HOME}/.vimrc"
        vim_install_colorshemes
        vim_install_plug
    else
        echo "Error: Neither Neovim nor Vim is installed."
        return 1
    fi
}

install

