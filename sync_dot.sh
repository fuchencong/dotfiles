#!/usr/bin/env bash

# Copyright (C) fuchencong.com


function pack_nvim() {
    cp ~/.config/nvim/init.lua  ./.config/nvim/
    cp -rf ~/.config/nvim/lua/  ./.config/nvim/
}

function install_nvim() {
    cp ./config/nvim/init.lua   ~/.config/nvim/init.lua 
    cp -rf ./config/nvim/lua/   ~/.config/nvim/
}

function pack() {
    if [ $1 == "nvim" ]; then
        pack_nvim
    else
        echo "invalid module"
    fi
}

function install() {
    if [ $1 == "nvim" ]; then
        install_nvim
    else
        echo "invalid module"
    fi
}

if [ $# -ne 2 ]; then
    echo "Usage: $0 pack|install module"
    exit 1
fi


if [ $1 == "pack" ]; then
    pack $2
elif [ $1 == "install" ]; then
    install $2
else
    echo "invalid action"
fi
