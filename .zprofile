# ALIASES

alias cls="clear"
alias f="find . -iname"
alias fdiff="diff -rq"
alias g="git"
alias gdiff="git diff --no-index"
alias grep="grep --color"
alias ls="ls --color"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ll -a"
alias psg="ps aux | grep"
alias rm="rm -i"
alias sha256="shasum -a 256"
alias sizeof="du -sh"
alias tree="tree -C"

# FUNCTIONS

# fif(directory, str): "Find in Folder" intra-file text search
fif() {
    grep --color --ignore-case --recursive --line-number "$1" -e "$2";
}

# fuzzy(directory, filename): fuzzy filename search
fuzzy() {
    find "$1" -iname \*"$2"\*;
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

# git-sync-master(): pull master & merge into current branch
git-sync-master() {
    currBranch=$(git rev-parse --abbrev-ref HEAD)
    git stash save
    git checkout master
    git pull
    git checkout "$currBranch"
    git merge master
}

# infinite-retry(command): Try to run $command forever until it succeeds
infinite-retry() {
    while ! "$@";
    do
        echo Sleeping... $(date)
        sleep 15
    done
}

# MAC OS

# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
