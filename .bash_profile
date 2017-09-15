# --- Alias and auto-complete --------------------------------------------------
# Listing
alias ll="ls -laG"
alias l.="ls -dlG .*"
alias l="ls -lG"

alias c="clear"

alias chown='chown --preserve-root'
alias chmod='chmod'
alias chgrp='chgrp --preserve-root'
alias rm="rm -i"
alias cp="cp -ia"
alias mv="mv -i"
alias mkdir="mkdir -pv"

alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Copy current path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Dev stuff
alias grep="grep --color=always"
alias diff="colordiff"
alias todos="ack '(TODO|FIX(ME)?)'"
alias todoscount="todos | wc -l"

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# GIT autocomplete
source ~/bin/git-completion.bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# GIT aware prompt
source ~/bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="true"
export GIT_PS1_SHOWUPSTREAM="verbose"

git_current_branch_name="\$(__git_ps1 '%s' | sed 's/ .\+//' | sed -e 's/[\\\\/&]/\\\\\\\\&/g')"
git_status_substitutes=(
    "s/$git_current_branch_name//;" # remove branch temporarily
    "s/u//;" # upstream
    "s/+\([0-9]\+\)/▴\1/;" # outgoing
    "s/-\([0-9]\+\)/▾\1/;" # incoming
    "s/%/?/;" # untracked
    "s/+/✓/;" # staged
    "s/*/✕/;" # unstaged
    "s/\(.\+\)/($git_current_branch_name\1)/;" # insert branch again
)
git_status_command="\$(__git_ps1 '%s'| sed \"${git_status_substitutes[@]}\")"

PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '

# --- Paths --------------------------------------------------------------------

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.profile

# --- Use freedesktop XDG folder schemes
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Set vimrc's location and source it on vim startup
# TODO This currently clashes with Neovim
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

export PATH="/usr/local/sbin:$PATH"

# Android SDK Tools
export PATH=${PATH}:/Users/vk/work/tools/android-sdk-macosx/platform-tools:/Users/vk/work/tools/android-sdk-macosx/tools

# Homebrew
alias vim="/usr/local/bin/vim"

###-tns-completion-start-###
if [ -f /Users/vk/.tnsrc ]; then
    source /Users/vk/.tnsrc
fi
###-tns-completion-end-###

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
