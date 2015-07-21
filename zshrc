#############################################################
#                      Terminal Conf                        #
#############################################################

# Export SHELL type
export TERM='xterm-256color'

#############################################################
#                       SHELL Conf                          #
#############################################################

# Customize to your needs...
export PATH=/usr/local/rvm/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

# umask and nocore
umask   022
limit   core 0

# Alias

alias ls='ls --color'
alias grep='grep --color=auto'

alias h='fc -l'
alias j=jobs
alias ll='ls -laFo'
alias l='ls -l'
alias lsd='ls -ld *(/)'

alias rm='nocorrect rm -i'
alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp -i'       # no spelling correction on cp
alias mkdir='nocorrect mkdir'   # no spelling correction on mkdir

alias v='vim'
alias vi='vim'

#############################################################
#                       Oh My ZSH                           #
#############################################################

# To install oh my zsh : 
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="blinks"
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bgnotify bower celery coffe colorize composer cp django docker git-flow grunt npm pel pip python tmux screen ssh-agent sudo symfony2 termitator debian gem ruby git)

source $ZSH/oh-my-zsh.sh

#############################################################
#                        ZSH Conf                           #
#############################################################

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# History

export  HISTSIZE=4096
export  SAVEHIST=4096

# SSH agent / KEYRING

export  $(gnome-keyring-daemon --daemonize --start)

# Key Binding

bindkey -e
bindkey "\e[3~" delete-char
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line

# ZSH otpions

setopt  auto_cd
setopt  hist_ignore_dups
setopt  auto_list
setopt  append_history
setopt  auto_param_keys
setopt  auto_param_slash
setopt  no_bg_nice
setopt  complete_aliases
setopt  equals
setopt  extended_glob
setopt  hash_cmds
setopt  hash_dirs
setopt  mail_warning
setopt  magic_equal_subst
setopt  numericglobsort
setopt  nobeep
setopt  nolistbeep
setopt  nohistbeep

# compctl

compctl -g '*(-/D)' cd

# Completion configuration

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' format $'%{\e[32m%}=> %{\e[01m%}%d%{\e[0m%}'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=5
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*:processes' list-colors '=(#b)(?????)(#B)?????????????????????????????????([^ ]#/)#(#b)([^ /]#)*=00
=01;31=01;33'

#############################################################
#                     PowerLine Conf                        #
#############################################################

function _update_ps1()
{  
    if [ -e ~/development/powerline-zsh/powerline-zsh.py ]
    then
        export PROMPT="$(~/development/powerline-zsh/powerline-zsh.py $?)"
    fi
}
precmd()
{
    _update_ps1
}

#############################################################
#                        OVH Conf                           #
#############################################################

domain=`hostname | cut -d '.' -f2-`

if [ ${domain} = 'ovh.net' ]
then
    source ~/.ovhrc
fi
