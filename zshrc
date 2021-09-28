#############################################################
#                      Terminal Conf                        #
#############################################################

# Export SHELL type
export TERM='xterm-256color'

#############################################################
#                       SHELL Conf                          #
#############################################################

# Customize to your needs...
#export PATH=$HOME/.local/bin:/usr/local/rvm/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
#export PATH=$HOME/.local/bin:$PATH

# umask and nocore
umask   022
limit   core 0

# Alias

if [[ $(uname) == "Darwin" ]]
then
	alias ls='ls -G'
else
	alias ls='ls --color'
fi

alias grep='grep --color=auto'

alias ll='ls -laFo'
alias l='ls -l'
alias lsd='ls -ld *(/)'

alias rm='nocorrect rm -i'
alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp -i'       # no spelling correction on cp
alias mkdir='nocorrect mkdir'   # no spelling correction on mkdir

alias v='vim'
alias vi='vim'

function salt-encryt {
	if [ -n "${1}" ]
	then
		echo -n "${1}" | gpg --armor --batch --trust-model always --encrypt -r saltmaster
	else
		echo "You must provide a text to encryt as parameter (between '\"' if there is space in it)."
	fi
}

#############################################################
#                       Oh My ZSH                           #
#############################################################

# To install oh my zsh :
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="whyrl"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bgnotify colorize cp docker git-flow pip python sudo debian gem ruby git)

#############################################################
#                      Load local Conf                      #
#############################################################
if [ -e ~/.local/zsh/rc ]
then
    source ~/.local/zsh/rc
fi

#############################################################
#                       Startup OMZ                         #
#############################################################

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

#which gnome-keyring-daemon 2>&1 > /dev/null && export  $(gnome-keyring-daemon --daemonize --start)
#ssh-agent | eval

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
