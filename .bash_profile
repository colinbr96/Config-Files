# FUNCTIONS

# find_in_folder(directory, str): intra-file text search
find_in_folder() { grep --color --ignore-case --recursive --line-number "$1" -e "$2"; }
# fuzzy(directory, filename): fuzzy filename search
fuzzy() { find "$1" -iname \*$2\*; }
# mkcdir(directory): mkdir and then cd
mkcdir() { mkdir -p -- "$1"; cd -P -- "$1"; }


# COLORS

C="\033[" # color escape sequence
END="\[${C}m\]" # end of formatting

WHITE="\[${C}37m\]"
CYAN="\[${C}36m\]"
GREEN="\[${C}32m\]"
YELLOW="\[${C}33m\]"
RED="\[${C}31m\]"

export PS1="${CYAN}\u${WHITE}@${GREEN}\h${WHITE}:${YELLOW}\W${WHITE}\$ ${END}" # normal
# export PS1="${RED}\u${WHITE}@${RED}\h${WHITE}:${RED}\W${WHITE}\$ ${END}" # root
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# ALIASES

alias l='ls'
alias la="ls -a"
alias ll='ls -lh --time-style=+"%b %d %H:%M:%S"'
alias lla='ll -a'

alias rm="rm -i"
alias grep="grep --color"

alias cls="clear"
alias fdiff="diff -rq"
alias fif="find_in_folder"
alias gdiff='git diff --no-index'
alias psg="ps aux | grep"
alias sizeof="du -sh"
alias sha256="shasum -a 256"
alias f="find . -iname"
alias tree="tree -C"
alias g="git"


# MACOS-SPECIFIC ALIASES

alias showHiddenFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hideHiddenFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
