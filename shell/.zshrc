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

#########
# aliases

# coloured ls output
alias ls="ls --color=auto"

# see all files in a directory
alias l="ls -a"

# search for a process
alias pag="ps aux | ag -i"

# run a process in the background, quietly
alias n="ruhig"

# delete something
alias r="rm -r"

# REALLY delete something
alias rr="rm -rf"

# moving up a directory...
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.." # ... no, I didn't write this by hand;
alias uuuuu="cd ../../../../.." # I used a keyboard macro in Emacs!
alias uuuuuu="cd ../../../../../.."
alias uuuuuuu="cd ../../../../../../.."
alias uuuuuuuu="cd ../../../../../../../.."
alias uuuuuuuuu="cd ../../../../../../../../.."
alias uuuuuuuuuu="cd ../../../../../../../../../.."
alias uuuuuuuuuuu="cd ../../../../../../../../../../.."
alias uuuuuuuuuuuu="cd ../../../../../../../../../../../.."
alias uuuuuuuuuuuuu="cd ../../../../../../../../../../../../.."
alias uuuuuuuuuuuuuu="cd ../../../../../../../../../../../../../.."
alias uuuuuuuuuuuuuuu="cd ../../../../../../../../../../../../../../.."
alias uuuuuuuuuuuuuuuu="cd ../../../../../../../../../../../../../../../.."
alias uuuuuuuuuuuuuuuuu="cd ../../../../../../../../../../../../../../../../.."

# running Emacs with a file
alias e="ruhig emacsclient -t" # In a terminal...
alias ee="ruhig emacsclient -c" # ...or in the GUI.

# start redshift
alias rsh="ruhig redshift"

# set the wifi interface up or down
alias wup="sudo ip link set dev wlp1s0 up"
alias wdown="sudo ip link set dev wlp1s0 down"

# pvephzirag znp svygrevat
alias vent="wdown && sudo macchanger -e wlp1s0 > /dev/null && wup"
alias unvent="wdown && sudo macchanger -p wlp1s0 > /dev/null && wup"

# run Steam
alias stm='find ~/.steam/root/ \( \
                      -name "libgcc_s.so*" -o \
                      -name "libstdc++.so*" -o \
                      -name "libxcb.so*" -o \
                      -name "libgpg-error.so*" \) \
                      -print -delete \
                 && steam'

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
