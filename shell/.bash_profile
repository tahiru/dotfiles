# --------------------------------------------------
# Bash configurations and aliases
#
# 1. Environment configuration
# 2. Terminal improvements
# --------------------------------------------------

# Bash completion check
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Bash aliases check
if [ -f ~/.bash_aliases ];  then
    . ~/.bash_aliases
fi

# Viewing the git branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e 's/* \(.*\)/ (\1)/'
}

# ----------------------------
# 1. Environment configuration
# ----------------------------

# Load the shell dotfiles, and more
source ~/.bash_prompt

for FILE in ~/.{bash_prompt}; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE";
done;
unset FILE;

# Set paths
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin/:/usr/local/:/user/local/sbin/:$PATH"

# Set the default editor
export EDITOR=/usr/bin/vim

# Default blocksize for commands like ls, df, du
export BLOCKSIZE=1k

# ------------------------
# 2. Terminal improvements
# ------------------------

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias ls="ls -GFhl"
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"
alias ll="ls -FGlAhp"
alias less="less -FSRXc"

# Always list directory contents upon cd
cd() {
    builtin cd "$@"; ll;
}

alias cd..="cd ../"
alias ..="cd ../"
alias ...="cd ../../"
alias .3="cd ../../../"
alias .4="../../../../"
alias .5="../../../../../"
alias .6="../../../../../../"
alias edit="subl"
alias tedit="$EDITOR $1" # terminal edit with your choice of edit (vim, nane, etc.)
alias finder="open -a Finder ./"
alias ~="cd ~"
alias c="clear"
alias which="type -all"
alias path="echo -e ${PATH///:\\n}"
alias show_options="shopt"
alias fix_stty="stty sane"
alias cic="set completion-ignore-case On"

# Create a new directory and move into it
mcd() {
   mkdir -p "$1" && cd "$1";
}

# Moves a file to Mac OS X's trash
trash() {
    command mv "$@" ~/.Tras;h
}