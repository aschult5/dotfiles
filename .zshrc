#
# non-zsh specific
#
#colors
source ~/.lscolors

#ssh with gpg 
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
   export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 0
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format ' %F{blue}-- %d --%f'
zstyle ':completion:*' glob 0
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %l%s
zstyle ':completion:*' substitute 0
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/aschultz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#
# Key Bindings
#
bindkey '^g' accept-search
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi


bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

# remove characters that aren't part of a word
WORDCHARS=${WORDCHARS//[_.-\/]}

#
# Completion
#
setopt ALWAYS_TO_END      # Move cursor to the end of a completed word.
setopt AUTO_LIST          # Automatically list choices on ambiguous completion.
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH   # If completed parameter is a directory, add a trailing slash.
setopt AUTO_REMOVE_SLASH
unsetopt flowcontrol
setopt LIST_AMBIGUOUS
unsetopt MENU_COMPLETE
setopt PUSHD_SILENT


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOOGLE_CLOUD_SDK=${HOME}/google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${GOOGLE_CLOUD_SDK}/path.zsh.inc" ]; then . "${GOOGLE_CLOUD_SDK}/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${GOOGLE_CLOUD_SDK}/completion.zsh.inc" ]; then . "${GOOGLE_CLOUD_SDK}/completion.zsh.inc"; fi
export GOOGLE_APPLICATION_CREDENTIALS="/run/media/aschultz/ENCRYPTUSB/dev/Nodeler-2f4fa7ef94ff.json"
export ENDPOINTS_GAE_SDK="${GOOGLE_CLOUD_SDK}/platform/google_appengine"
export PYTHONPATH="${GOOGLE_CLOUD_SDK}/platform/google_appengine"

export PATH=$PATH:/opt/apps/bin
export PATH=$PATH:${HOME}/vendor/bin
export PATH=$PATH:${HOME}/.local/bin

alias dog='highlight -O ansi --force'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
