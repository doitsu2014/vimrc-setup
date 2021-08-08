#!/bin/bash
# Setup utilities
confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

# Setup variables
var_vimrc=.vimrc
var_runtime=~/.vim_runtime
var_setupdir=$(pwd)
date=$(date '+%Y-%m-%d-%H-%M-%S')
echo "Working time:  ${date}"

# Setup .vim directory
mkdir -p ~/.vim

echo "***********************Setup ultimate vimrc***********************"
[[ ! -d ${var_runtime} ]] && git clone https://github.com/doitsu2014/vimrc ${var_runtime}
confirm "Do you want to update plugins? [y/N]" && cd ${var_runtime} &&  git reset --hard &&  git clean -d --force &&  git pull --rebase &&  python3 update_plugins.py
echo "*******************************************************************"
echo ""
echo ""
echo "***********************Updating my_config.vim***********************"
cd ${var_setupdir}
echo "Change to setup directory: ${var_setupdir}"
cp -r ./my_configs.vim ${var_runtime}/my_configs.vim

[[ ! -d "${var_runtime}/my_plugins/vimspector" ]] && git clone https://github.com/puremourning/vimspector "${var_runtime}/my_plugins/vimspector"

echo "copied all to ${var_runtime}"
sh ${var_runtime}/install_awesome_vimrc.sh
echo "********************************************************************"
