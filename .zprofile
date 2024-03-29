# ALIASES

alias cls="clear"
alias f="find . -iname"
alias fdiff="diff -rq"
alias g="git"
alias gdiff="git diff --no-index"
alias glg="hwatch --color git -c color.ui=always lg"
alias grep="grep --color"
alias ls="ls --color"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ll -a"
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

# psg(str): Grep running processes, but nicer
psg() {
    ps aux | head -n 1; # Print headers
    ps aux | grep -v grep | grep "$1"; # Exclude grep itself
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

# git-delete-branch(name): deletes a git branch locally and remotely
git_delete_branch() {
    branch_name=$1
    echo -n "Delete local? [y/N]: "
    read delete_local

    if [[ $delete_local == "y" ]]; then
        git branch -d $branch_name
    fi

    echo -n "Delete remote? [y/N]: "
    read  delete_remote

    if [[ $delete_remote == "y" ]]; then
        echo -n "Remote? [origin]: "
        read remote
        remote="${remote:=origin}"
        git push $remote --delete $branch_name
    fi
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

# git-rstatus: calls git status for all directories in the current directory
git-rstatus() {
    for d in ./*/; do
        echo "$d"
        cd "$d"
        git status --short --branch
        cd ..
        echo ""
    done
}

# infinite-retry(command): Try to run $command forever until it succeeds
infinite-retry() {
    while ! "$@";
    do
        echo Sleeping... $(date)
        sleep 15
    done
}

# dockersh(container): Open a bash shell on a specified container
dockersh() {
    docker exec -it $1 /bin/bash
}

# MAC OS

# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
