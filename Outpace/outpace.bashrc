export NGINX_URL=http://localhost:7999
export NGINX_PUBLIC_URL=http://localhost:8080

#common.aliases stuff
alias l='ls -lAF'
alias ll='l'
#end common.aliases stuff

alias go_ftp='ssh ubuntu@54.200.128.164'
alias go_km='ssh ubuntu@172.31.25.28'

alias emacsnw='TERM=xterm-256color emacs -nw'
alias vim='/usr/local/Cellar/vim/7.4.2085/bin/vim'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
complete -C aws_completer aws

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

if [ -e $HOME/.outpace/bashrc ]; then
  source "$HOME/.outpace/bashrc"
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

export ENVIRONMENT_NAME=localdev
export EDITOR=vim
export ANSIBLE_COW_SELECTION=random
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK=$HOME/Library/Android/ndk_r10e

OUTPACE_ALIASES="$HOME/Projects/dotfiles/Outpace/outpace.aliases"
[[ -s $OUTPACE_ALIASES ]] && source $OUTPACE_ALIASES
PERSONAL_ALIASES="$HOME/Projects/dotfiles/personal.aliases"
[[ -s $PERSONAL_ALIASES ]] && source $PERSONAL_ALIASES

# Base16 Shell
BASE16_SHELL="$HOME/Projects/base16-shell/scripts/base16-default-dark.sh"
[[ -s $BASE16_SHELL && -n "$ITERM_SESSION_ID" ]] && source $BASE16_SHELL

if [[ -n $ENVIRONMENT_NAME || -n $SERVICE_NAME ]]; then
   export MACHINE_DESCRIPTION="$ENVIRONMENT_NAME $SERVICE_NAME:"
fi

PATH=$PATH:/usr/local/sbin:/usr/local/bin:$HOME/.rvm/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(rbenv init -)"

[ -s "/Users/rustybentley/.scm_breeze/scm_breeze.sh" ] && source "/Users/rustybentley/.scm_breeze/scm_breeze.sh"
# override scm_breeze gr alias
alias gr='cd $STARWOOD_HOME'

# Whenever a command is executed, write it to a global history
PROMPT_COMMAND="history -a ~/.bash_history.global; $PROMPT_COMMAND"
# On C-r set HISTFILE and run hh
bind -x '"\C-r": "HISTFILE=~/.bash_history.global hh"'

# tell me something I don't know
#fortune | cowsay