export EDITOR=vim
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$ZDOTDIR/zsh_history
export VIMINIT="source ${HOME}/.config/vim/vimrc"
export PYTHONDONTWRITEBYTECODE=1
export GOPATH=$HOME/vendor/go

test -e $HOME/.secrets/env && source $HOME/.secrets/env
