#
# non-zsh specific
#
#colors
source ~/.lscolors

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory autocd nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%F{yellow}-- %d --%f'
zstyle ':completion:*' completer _complete _ignored _match _correct _approximate
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

# Key Bindings
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

WORDCHARS=${WORDCHARS//[_.-\/]}
# End of Key Bindings

# Completion
setopt ALWAYS_TO_END      # Move cursor to the end of a completed word.
setopt AUTO_LIST          # Automatically list choices on ambiguous completion.
setopt AUTO_MENU
setopt AUTO_REMOVE_SLASH
setopt COMPLETE_IN_WORD
unsetopt flowcontrol
setopt LIST_AMBIGUOUS
unsetopt MENU_COMPLETE
setopt PUSHD_SILENT
# End of Completion

# Google Cloud
export GOOGLE_CLOUD_SDK=${HOME}/google-cloud-sdk
if [ -f "${GOOGLE_CLOUD_SDK}/path.zsh.inc" ]; then . "${GOOGLE_CLOUD_SDK}/path.zsh.inc"; fi
if [ -f "${GOOGLE_CLOUD_SDK}/completion.zsh.inc" ]; then . "${GOOGLE_CLOUD_SDK}/completion.zsh.inc"; fi
# End of Google Cloud

# Aliases
alias dog='highlight -O ansi --force'
# End of Aliases

# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# End of Plugins
