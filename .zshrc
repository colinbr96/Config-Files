setopt PROMPT_SUBST
setopt IGNORE_EOF

_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

precmd() {
  GIT_BRANCH=$(_git_branch)
}

PROMPT='%F{cyan}%n%F{white}@%F{cyan}%m%F{white}:%F{green}%1d%F{yellow}${GIT_BRANCH} %F{magenta}[%*] %(?.%F{white}.%F{red})%?%f
$ '

# Auto-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# MacOS:

# bindkey "^[[H" beginning-of-line # Home
# bindkey "^[[F" end-of-line # End
# bindkey "^[^[[D" backward-word # Alt + Left Arrow
# bindkey "^[^[[C" forward-word # Alt + Right Arrow

# Sublime text (subl)
# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# VSCode (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
