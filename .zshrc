# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/sumeet/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PROMPT='
%F{010}%n %F{white}at %F{012}%m %F{white}in %F{130}${PWD/#$HOME/~} %F{white}${vcs_info_msg_0_} 
%# ' RPROMPT=' %(?.%F{green}√.%F{red}?%?)%f'
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Options
setopt AUTO_CD
setopt NO_CASE_GLOB
setopt CORRECT
setopt CORRECT_ALL
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first 
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Source files
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -r "$file" ] && source "$file";
done
unset file;

# Go 
export GO111MODULE="auto"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
