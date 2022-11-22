setopt PROMPT_SUBST

_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT='%F{cyan}%n@%m%F{white}:%F{green}%~%F{yellow}$(_git_branch) %(?.%F{white}.%F{red})%?%f
$ '

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
