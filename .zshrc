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
# Powerlevel9k
#
export DEFAULT_USER=aschultz
POWERLEVEL9K_MODE='nerdfont-complete'

# ...Dir
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='70'
POWERLEVEL9K_DIR_HOME_BACKGROUND='70'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='70'
POWERLEVEL9K_DIR_ETC_BACKGROUND='red'
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false
POWERLEVEL9K_DIR_PATH_SEPARATOR=" %F{black} "
POWERLEVEL9K_FOLDER_ICON=$'\uf0ac'
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=''
POWERLEVEL9K_HOME_ICON=$'\uf1bb'
POWERLEVEL9K_HOME_SUB_ICON=$POWERLEVEL9K_HOME_ICON
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_FOLDER_ICON='\uf115'
#POWERLEVEL9K_FOLDER_ICON=$'\uf07c'
#POWERLEVEL9K_FOLDER_ICON=$'\uf472'
#POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=$'\uf015 '
#POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=$'\uf38d'
#POWERLEVEL9K_HOME_SUB_ICON=$'\uE18D '

# ...OS/Linux
POWERLEVEL9K_LINUX_ICON=$'\uf314'
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_OS_ICON_FOREGROUND='70'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='136'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='238'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='magenta'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='236'

# ...Time
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_EXECUTION_TIME_ICON=$'\uf253 '

# ...Status
POWERLEVEL9K_STATUS_BACKGROUND='black'
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_STATUS_OK=true
POWERLEVEL9K_OK_ICON=${POWERLEVEL9K_LINUX_ICON}
# POWERLEVEL9K_STATUS_OK_BACKGROUND='black'
POWERLEVEL9K_STATUS_OK_FOREGROUND='70'

# ...Vi Mode
POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_VI_COMMAND_MODE_STRING='%F{green} \ue62b %F{black}'

# ...Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode command_execution_time background_jobs history time)

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

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

export GOOGLE_CLOUD_SDK='${GOOGLE_CLOUD_SDK}'
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
