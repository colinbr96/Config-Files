setopt PROMPT_SUBST

_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT='%F{cyan}%n@%m%F{white}:%F{green}%~%F{yellow}$(_git_branch) %F{magenta}[%*] %(?.%F{white}.%F{red})%?%f
$ '

# Auto-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Fix key bindings
bindkey "^[[H" beginning-of-line # Home
bindkey "^[[F" end-of-line # End
bindkey "^[^[[D" backward-word # Alt + Left Arrow
bindkey "^[^[[C" forward-word # Alt + Right Arrow

