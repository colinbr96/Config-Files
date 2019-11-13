# FUNCTIONS

# fif(directory, str): "Find in Folder" intra-file text search
fif() {
    grep --color --ignore-case --recursive --line-number "$1" -e "$2";
}

# fuzzy(directory, filename): fuzzy filename search
fuzzy() {
    find "$1" -iname \*$2\*;
}

# mkcdir(directory): mkdir and then cd
mkcdir() {
    mkdir -p -- "$1"; cd -P -- "$1";
}

# git-rename-branch(name): renames a git branch locally and remotely
git-rename-branch() {
    if ! git rev-parse --git-dir > /dev/null; then
        return 1
    fi
    oldName=$(git rev-parse --abbrev-ref HEAD)
    newName="$1"

    git branch -m "$oldName" "$newName"
    git push origin :"$oldName" "$newName"
    git push origin -u "$newName"
}


# COLORS

C="\033[" # color escape sequence
END="\[${C}m\]" # end of formatting

WHITE="\[${C}37m\]"
CYAN="\[${C}36m\]"
GREEN="\[${C}32m\]"
YELLOW="\[${C}33m\]"
RED="\[${C}31m\]"

# BASH PROMPT

_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="${CYAN}\u@\h${WHITE}:${GREEN}\W${YELLOW}\$(_git_branch)${WHITE}\$ ${END}"
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
