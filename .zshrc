# Emacs ライクな操作を有効にする（文字入力中に Ctrl-F,B でカーソル移動など）
# Vi ライクな操作が好みであれば `bindkey -v` とする
bindkey -v

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -U compinit; compinit

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# ↑を設定すると、 .. とだけ入力したら1つ上のディレクトリに移動できるので……
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd -<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
# （たとえば `mv hoge.* ~/dir` における "*"）
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
setopt extended_glob

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
#
# # メモリに保存される履歴の件数
export HISTSIZE=1000
#
# # 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


bindkey -M viins '^W' vi-cmd-mode
bindkey -v '^L'   forward-char
bindkey -v '^H'   backward-char
bindkey -v '^K'   up-line-or-history
bindkey -v '^J'   down-line-or-history

alias e='exit'

# autoload -U compinit
# compinit

export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# th=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u
RPROMPT='[%~]'

PROMPT=$'$ '

#PROMPT='[%n@%m]# '
#RPROMPT='[%d]'
# export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH:python3:pip3"
export PYTHONPATH=python:pip3

# 大文字小文字区別しない
zstyle ':completion:*' matcher-list 'm:{}a-z}={}A-Z}'

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVESIZE=1000000

setopt share_history
setopt hist_ignore_all_dups

# この行は現在のパスを表示する設定です。ブランチを表示して色をつける設定とは関係ありません
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
[[ -n "$VIMRUNTIME" ]] && \
    PROMPT="%{${fg[white]}${bg[blue]}%}(vim)%{${reset_color}%} $PROMPT"

# git関連
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

alias rm='rm -rf'
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'
export GOPATH=/Users/mituba/go
#alias ls='ls -a'
stty stop undef
stty start undef

alias dockerrm='docker rm -f $(docker ps -qa)'
alias dockerrmi='docker rmi -f $(docker images -q)'
# alias python='python -B'

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

export PATH="/Users/username/.pyenv:$PATH"
eval "$(pyenv init -)"

export PATH=$PATH:$GOPATH/bin
export ANDROID_HOME=/Users/mituba/Library/Android/sdk

alias atmkdir='for i in A B C D ; do mkdir "$i"; touch "$i"/main.py ;done '

export PATH=/Users/mituba/proggraming_practice/flutter/bin:$PATH
alias py3='python3'

export PATH="/usr/local/opt/python@2/bin:$PATH"

# git command
alias gco='git checkout'
alias gpl='git pull'
alias gps='git push'
alias gcm='git commit'
alias gst='git status'

export TERM=xterm-256color

