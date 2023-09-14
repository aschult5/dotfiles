export EDITOR=vim
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$ZDOTDIR/zsh_history
export VIMINIT="source ${HOME}/.config/vim/vimrc"
export PYTHONDONTWRITEBYTECODE=1
export GOPATH=$HOME/vendor/go

test -e $HOME/.secrets/env && source $HOME/.secrets/env

#ssh with gpg 
GPG_TTY=$(tty)
export GPG_TTY
if [ -z "$GPG_AGENT_INFO" ]; then
    eval "$(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)"
fi

# timezone
export TZ='America/Denver'

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
   export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export PATH=${HOME}/.local/bin:/usr/sbin:${PATH}

# for zsh-autocomplete
skip_global_compinit=1

