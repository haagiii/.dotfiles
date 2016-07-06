# Created by newuser for 5.1.1
autoload -U compinit; 
compinit

#------------------------------------------
# コマンド履歴
#------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#------------------------------------------
# コマンド履歴検索
#------------------------------------------
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#------------------------------------------
# プロンプトの設定
#------------------------------------------
PROMPT='%{[33;38;5;082m%}%n@%m:%f%{[0m%}%{[33;38;5;014m%}%~%{[0m%}
$ '

# ディレクトリ名を入力するだけで移動
# setopt auto_cd

# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd

# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep

#------------------------------------------
# setting alias
#------------------------------------------
export LESS='-N -R'
# alias ls='ls -ali --color=always | less'
alias ls='ls -ali --color=always'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#------------------------------------------
# setting clojure
#------------------------------------------
. ~/.lein/zsh_completion.zsh

#------------------------------------------
# setting python
#------------------------------------------
export PYENV_ROOT="${HOME}/.pyenv"
if [ -n ${PYENV_ROOT} ]; then
	path=(${PYENV_ROOT}/bin ${PYENV_ROOT}/shims ${path})
fi
eval "$(pyenv init -)"

#------------------------------------------
# setting ruby
#------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
. ~/.rbenv/completions/rbenv.zsh






# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# case $- in
#     *i*) ;;
#       *) return;;
# esac
# 
# # don't put duplicate lines or lines starting with space in the history.
# # See bash(1) for more options
# HISTCONTROL=ignoreboth
# 
# # append to the history file, don't overwrite it
# shopt -s histappend
# 
# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000
# 
# # check the window size after each command and, if necessary,
# # update the values of LINES and COLUMNS.
# shopt -s checkwinsize
# 
# # If set, the pattern "**" used in a pathname expansion context will
# # match all files and zero or more directories and subdirectories.
# #shopt -s globstar
# 
# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# 
# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi
# 
# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
#     xterm-256color) color_prompt=yes;;
#     screen) color_prompt=yes;;
#     screen-256color) color_prompt=yes;;
# esac
# 
# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# #force_color_prompt=yes
# 
# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi
# 
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac
# 
# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     # alias ls='ls -ali --color=always | less'
#     alias ls='ls -ali --color=always'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'
# 
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi
# 
# # Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# 
# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.
# 
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
# 
# export LESS='-N -R'
# 
# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi
# 
# # prompt command
# hg_branch() {
# 	hg branch 2> /dev/null | awk '{printf "(hg:" $1 ")"}'
# }
# 
# git_branch() {
# 	__git_ps1 '(%s)'
# }
# 
# if [ "$color_prompt" = yes ]; then
# 	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]$(git_branch)$(hg_branch)\n\$ '
# else
# 	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(git_branch)$(hg_branch)\n\$ '
# fi
# unset color_prompt force_color_prompt
# 
# # PATH="$PATH:~/bin"
# 
