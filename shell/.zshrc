#############################################
# Daantjie's (interactive) zsh configuration.
#############################################

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#########
# sources

source ~/.liquidprompt/liquidprompt
source ~/lib/aliases

#########
# exports

export LP_MARK_PREFIX=$'\n ··· '
export LP_MARK_DEFAULT=$'→'
# So prompt looks like this:
##[daniel:~]
## ··· →

# Get rid of changing prompt symbol (due to VC repos)
export LP_MARK_HG="$LP_MARK_DEFAULT"
export LP_MARK_SVN="$LP_MARK_DEFAULT"
export LP_MARK_GIT="$LP_MARK_DEFAULT"
export LP_MARK_FOSSIL="$LP_MARK_DEFAULT"
export LP_MARK_BZR="$LP_MARK_DEFAULT"
export LP_MARK_DISABLED="$LP_MARK_DEFAULT"

# add several `bins'
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

# tell the computer who I am
export EMAIL="danieltheexperimenter@gmail.com"
export NAME="Daniel Oosthuizen"
export SMTPSERVER="smtp.gmail.com"

# for rvm (Ruby Version Manager)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export XDG_CONFIG_HOME="$HOME/.config/"

export ALTERNATE_EDITOR=""
export EDITOR=emacsclient

###########
# functions

# run a process in the backround, quietly
ruhig () {
    `nohup $@ &>/dev/null &`
}

# mkdir and cd combined
mk () {
    mkdir -p $@; cd $_
}

# adding aliases
new-alias () {
    printf "Description: "
    read DESC
    echo -e "\n# $DESC\nalias $@" >> ~/lib/aliases
    source ~/lib/aliases # reload aliases
}

#########
# aliases

## -> /lib/aliases

############
# deprecated

# # alias for Mornington Crescent interpreter
# alias crescent="python $HOME/source/Esoterpret/esoterpret.py \
#                        --nogui \
#                        -l morningtoncrescent"

# # so that ConTeXt can find the fonts
# export OSFONTDIR="/usr/local/share/fonts;$HOME/.fonts"
# # and that the correct version of ConTeXt is used
# alias usingcontext=`source /opt/context-minimals/setuptex`

# # alias for the Pyth interpreter
# alias pyth="python3 $HOME/source/pyth/pyth.py"
# function pyth_oneliner {
#     echo $1 | pyth
# }
# alias p="pyth_oneliner"
