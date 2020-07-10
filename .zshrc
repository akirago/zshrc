export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# 環境変数
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# プラグインを有効化
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='%T %~ %F{magenta}$%f '
RPROMPT='${vcs_info_msg_0_}'

# alias
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'

# delete branch
alias zaraki='(){git branch | grep f | xargs git branch -D}'
alias madante='git branch | xargs git branch -D'

# look branch
alias gb='git branch'
alias gbr='git branch -r'
alias gbm='(){git branch -m $1}'

# look commit
alias glo='git log --oneline'

# look diff
alias gd='git diff'
alias gdc='git diff --cache'
alias gdb='(){git diff $1..$2}'

# checkout
alias gbc='{git branch | grep $1 | xargs git checkout -b test}'
alias ruler='f(){git checkout master};f'
alias gcr='(){git branch -r | sed -e "s/origin\///g" | grep $1 | xargs git checkout}'
alias gc='(){git branch | grep $1 | xargs git checkout}'
alias gcb='git fetch;(){git checkout -b $1 origin/develop}'
alias gsui='git submodule update --init'

# rebase
alias gro='git rebase -i origin/master'

# edit zshrc
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias vsz='vim ~/.zshrc; source ~/.zshrc'

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
