setopt PROMPT_SUBST

_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT='%F{cyan}%n@%m%F{white}:%F{green}%1d%F{yellow}$(_git_branch)%F{white}$ '
