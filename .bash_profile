# FUNCTIONS

find_in_folder() {  grep --exclude=*.pyc -rnw "$1" -e "$2"; }


# COLORS

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# ALIASES

alias la="ls -a"
alias ll="ls -la"
alias psg="ps aux | grep"
alias fdiff="diff -rq"
alias g++="g++ -std=c++11"
alias sizeof="du -sh"
alias fif="find_in_folder"


# MACOS-SPECIFIC ALIASES

alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"

