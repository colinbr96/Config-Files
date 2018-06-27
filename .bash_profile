# FUNCTIONS

# fif(directory, str): "Find in Folder" intra-file text search
fif() { grep --color --ignore-case --recursive --line-number "$1" -e "$2"; }
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

# Normal PS1:
export PS1="${CYAN}\u${WHITE}@${GREEN}\h${WHITE}:${YELLOW}\W${WHITE}\$ ${END}"
# Root PS1:
# export PS1="${RED}\u${WHITE}@${RED}\h${WHITE}:${RED}\W${WHITE}\$ ${END}"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# Auto-Complete Behavior

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"


# ALIASES

alias auth="ssh-add ~/.ssh/id_rsa"
alias cls="clear"
alias f="find . -iname"
alias fdiff="diff -rq"
alias g="git"
alias gdiff="git diff --no-index"
alias grep="grep --color"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ll -a"
alias ls="ls --color"
alias psg="ps aux | grep"
alias rm="rm -i"
alias sha256="shasum -a 256"
alias sizeof="du -sh"
alias tree="tree -C"


# MACOS

# alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
# alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
# alias hide="chflags hidden"
# alias unhide="chflags nohidden"
# alias sleeplog="pmset -g log"

# vol(float): set system volume to the given value
# vol() { osascript -e "set Volume ${1}"; }
