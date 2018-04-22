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

POWERLEVEL9K_VCS_BRANCH_ICON=$''
POWERLEVEL9K_COLOR_SCHEME='light'

# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='070'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='197'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='197'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='039'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='039'

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='white'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='white'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='241'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='039'

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S | %y/%m/%d}"

POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status docker_machine time)

