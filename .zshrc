#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#
#
# 大文字小文字区別しない
zstyle ':completion:*' matcher-list 'm:{}a-z}={}A-Z}'

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd -<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# no-beep
setopt no_beep

# key-bind
bindkey -M viins 'jj' vi-cmd-mode
bindkey -v '^L'   forward-char
bindkey -v '^H'   backward-char
bindkey -v '^K'   up-line-or-history
bindkey -v '^J'   down-line-or-history

# alias
alias e='exit'

alias rm='rm -rf'
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'
alias dockerrm='docker rm -f $(docker ps -qa)'
alias dockerrmi='docker rmi -f $(docker images -q)'
alias atmkdir='for i in A B C D ; do mkdir "$i"; touch "$i"/main.py ;done '

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# vim
stty stop undef
stty start undef

# fzf
function fzf-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | fzf`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N fzf-history-selection
bindkey '^R' fzf-history-selection

# ls
function chpwd() { ls }

POWERLEVEL9K_COLOR_SCHEME='light'

# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='070'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='197'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='197'

# dir
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='039'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
# POWERLEVEL9K_DIR_HOME_BACKGROUND='039'

# vi
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='white'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='white'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='241'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='039'

# icon
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# newline
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S | %y/%m/%d}"

# context
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="039"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_HOST_REMOTE_BACKGROUND="197"
POWERLEVEL9K_HOST_REMOTE_FOREGROUND="white"

# user
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="white"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_USER_ROOT_BACKGROUND="white"
POWERLEVEL9K_USER_ROOT_FOREGROUND="red"

# battery
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="white"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="white"
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="white"

# status
POWERLEVEL9K_STATUS_OK_BACKGROUND="white"

# writable
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND="white"
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND="black"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_SHORTEN_DELIMITER=..

# multiline
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭%F{cyan}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "

# command_execution_time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='white'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_RAM_BACKGROUND='white'
POWERLEVEL9K_IP_BACKGROUND='white'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context ssh dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable command_execution_time ip time)

