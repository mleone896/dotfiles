#!/usr/bin/env bash


# script to setup my dotfiles 
shout() { echo "$0: $*" >&2; }
barf() { shout "$*"; exit 111; }
try() { "$@" || barf "cannot $*"; }

# vars
path_to_repo="/home/mleone/repos/personal/dotfiles"

# link all my dotfiles
setup_symlinks(){
    for i in tmux.conf zshrc bashrc git-completion.bash git-prompt.sh vimrc \
        gitconfig inputrc vim_bundles
do
    [[ -f "$HOME/.${i}" ]] || [[ -L  "$HOME/.${i}" ]] && rm -rf $HOME/.${i}
    echo "about to link ${path_to_repo}/${i} to $HOME/.${i}"
    try ln -s ${path_to_repo}/${i} ${HOME}/.${i} # setup dotfiles from repo
done
} #close symlink creation



main() {
    if [[ ! -L ${HOME}/.oh-my-zsh ]]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
    fi

    setup_symlinks
}


# run the main method.. yeah thats right shell scripts
# ordered like a real program BASH FTW hack the planet
main
