#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# PATH の設定（お好みで）
export PATH="/usr/local/bin:$PATH"

# PATH の内容と同期している配列変数 path も使える
path=(
    ~/bin
    $path
)

# もし .zshenv を複数のマシンで共有していて、
# あるマシンには存在するが別のマシンには存在しないパスを PATH に追加したいなら、
# パスの後ろに (N-/) をつけるとよい
# こうすると、パスの場所にディレクトリが存在しない場合、パスが空文字列に置換される
# 詳細は `man zshexpn` の Glob Qualifiers を参照
path=(
    /machine1/only/bin(N-/)
    $path
)

# 履歴ファイルの保存先
export HISTFILE=${}HOME}/.zsh_history
#
# # メモリに保存される履歴の件数
export HISTSIZE=1000
#
# # 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
#
# # 重複を記録しない
setopt hist_ignore_dups
#
# # 開始と終了を記録
setopt EXTENDED_HISTORY
#
[[ -n "$VIMRUNTIME" ]] && \
    PROMPT="%{${fg[white]}${bg[blue]}%}(vim)%{${reset_color}%} $PROMPT"
