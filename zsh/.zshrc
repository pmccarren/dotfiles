
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

x-backward-kill-word(){
    WORDCHARS='.*?_-[]~\\/\!#$%^(){}<>|`@#$%^*()+:?' zle backward-kill-word
}
zle -N x-backward-kill-word 


# key bindings
bindkey '\e^?' x-backward-kill-word
bindkey '\e.' insert-last-word
bindkey "^R" history-incremental-search-backward
bindkey -e


# colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export CLICOLOR_FORC=true


# sensible ls
if [ "$platform" = 'freebsd' ]; then
	alias ls="ls -hG"
else
	alias ls="ls -h --color=auto"
fi
alias l="ls -a"
alias ll="ls -la"


# zshrc reloading
alias reload!='source ~/.zshrc'

function aps_smart_ls {
  clear && pwd
  if [[ `ls -a $* | wc -l` -lt 40 ]]; then
    ll $*
  else
    l $*
  fi
}
alias sl=aps_smart_ls


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
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory


# autocomplete
autoload -U compinit -u && compinit -u


# list TODO/FIX lines from the current project
alias todos="ack --nogroup '(TODO|FIX(ME)?):'"


# via http://thomashunter.name/blog/removing-duplicate-entries-from-finders-open-with-menu/
alias reset-finder-open-with-menu="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user; killall Finder"

# freindly MySQL prompt
export MYSQL_PS1="\u@\h [\d]> "

# vagrant aliases
alias vup="vagrant up"
alias vdf="vagrant destroy -f"
