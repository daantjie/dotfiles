#!/usr/bin/env bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/bin:$PATH"

export EMAIL="danieltheexperimenter@gmail.com"
export NAME="Daniel Oosthuizen"
export SMTPSERVER="smtp.gmail.com"

# for rvm (Ruby Version Manager)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# so that ConTeXt can find the fonts
export OSFONTDIR="/usr/local/share/fonts;$HOME/.fonts"
# and that the correct version of ConTeXt is used
alias usingcontext=`source /opt/context-minimals/setuptex`
# alias for the Pyth interpreter
alias pyth="python3 $HOME/source/pyth/pyth.py"
function pyth_oneliner {
    echo $1 | pyth
}
alias p="pyth_oneliner"
# alias for Mornington Crescent interpreter
alias crescent="python $HOME/source/Esoterpret/esoterpret.py --nogui -l morningtoncrescent"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Run a program in the background...
ruhig () {
    `$@ &>/dev/null &`
}
alias f=ruhig
# Search for processes...
alias pag="ps aux | ag -i"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export XDG_CONFIG_HOME="$HOME/.config/"
