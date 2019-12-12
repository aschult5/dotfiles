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
setopt appendhistory autocd nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%F{yellow}-- %d --%f'
zstyle ':completion:*' completer _complete _ignored _match _correct _prefix
zstyle ':completion:*' format '%F{blue}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %l%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/aschultz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
PROMPT='%B%(?.%F{green}√.%F{red}%?)%f%b %B%F{blue}%3~%f%b %(!.#.>) '
RPROMPT='%*'
# End prompt

#
# Key Bindings
#
bindkey '^g' accept-search

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
setopt COMPLETE_IN_WORD

export GOOGLE_CLOUD_SDK=${HOME}/google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${GOOGLE_CLOUD_SDK}/path.zsh.inc" ]; then . "${GOOGLE_CLOUD_SDK}/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${GOOGLE_CLOUD_SDK}/completion.zsh.inc" ]; then . "${GOOGLE_CLOUD_SDK}/completion.zsh.inc"; fi
export GOOGLE_APPLICATION_CREDENTIALS="/run/media/aschultz/ENCRYPTUSB/dev/Nodeler-2f4fa7ef94ff.json"
export ENDPOINTS_GAE_SDK="${GOOGLE_CLOUD_SDK}/platform/google_appengine"
export PYTHONPATH="${GOOGLE_CLOUD_SDK}/platform/google_appengine"

alias dog='highlight -O ansi --force'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
