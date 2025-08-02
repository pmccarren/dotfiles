
# misc includes
fpath=( "$HOME/.zfunctions" $fpath )

# autoload zsh env
[[ -a "~/.zshenv" ]] && source ~/.zshenv

# detect the platform
platform='unknown'
unamestr=`uname`
if [ "$unamestr" = 'Linux' ]; then
	platform='linux'
elif [ "$unamestr" = 'FreeBSD' ] || [ "$unamestr" = 'Darwin' ]; then
	platform='freebsd'
fi

# show prefix if we are root
export PURE_ROOT_HASH=1

# pure prompt
autoload -U colors && colors
autoload -U promptinit && promptinit
prompt pure


# bash style delete (^W, esc+bkslh)
x-bash-backward-kill-word(){
    WORDCHARS='' zle backward-kill-word

}
zle -N x-bash-backward-kill-word
bindkey '^W' x-bash-backward-kill-word
bindkey '\C-w' x-bash-backward-kill-word

x-backward-kill-word(){
    WORDCHARS='.*?_-[]~\\/\!#$%^(){}<>|`@#$%^*()+:?' zle backward-kill-word
}
zle -N x-backward-kill-word 

# fix Fn+Delete for OSX
bindkey "^[[3~" delete-char

bindkey '\e^?' x-backward-kill-word

# bash style escape+. (add last arg from last command)
bindkey '\e.' insert-last-word

# bash style history search
bindkey "^R" history-incremental-search-backward
bindkey -e

# colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export CLICOLOR_FORC=true

# editor
export EDITOR=vim

# C-x C-e bash-ism to edit the current command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '\C-x\C-e' edit-command-line

# history
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HISTIGNORESPACE # don't record command if it starts with a space
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

# autocomplete
autoload -U compinit -u && compinit -u

# freindly MySQL prompt
export MYSQL_PS1="\u@\h [\d]> "

# autoload pubip
autoload -Uz pubip

. ~/.zfunctions/aliases
. ~/.zfunctions/anybar
. ~/.zfunctions/cdown
. ~/.zfunctions/ghpr
. ~/.zfunctions/dirhistory
. ~/.zfunctions/encode64
. ~/.zfunctions/gitat
. ~/.zfunctions/laratail
. ~/.zfunctions/ntest
. ~/.zfunctions/ssht
. ~/.zfunctions/swapusage
. ~/.zfunctions/taill
. ~/.zfunctions/tmuxtitle
. ~/.zfunctions/trash
. ~/.zfunctions/git-config-repo-whr
. ~/.zfunctions/retry
. ~/.zfunctions/do-release
. ~/.zfunctions/git-clean-merged-gone

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

