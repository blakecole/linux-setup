# An example .bashrc file (MIT 2.680, Spring 2015)
# Progressively augmented by: Blake Cole
#-------------------------------------------------------
# Set the Shell Path (Order Matters!)
#-------------------------------------------------------
# 1) APT-GET & Native Ubuntu Apps
PATH=/usr/bin
PATH=$PATH:/usr/bin/X11
PATH=$PATH:/usr/sbin

# 2) Essential Ubuntu System
PATH=$PATH:/bin
PATH=$PATH:/sbin

# 6) MOOS Applications
PATH=$PATH:~/moos-ivp/bin
PATH=$PATH:~/moos-ivp-blerk/bin

# 4) Snap Space 
PATH=$PATH:/snap/bin

export PATH

#-------------------------------------------------------
# ALIASES
#-------------------------------------------------------
#source ~/GitHub/marine-autonomy/alias.txt
# Basic aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cdd='cd ..'
alias cddd='cd ../..'
alias cdddd='cd ../../..'

# Colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls -F --color=auto'
            alias ll='ls -hl --color=auto'
            alias dir='dir --color=auto'
            alias vdir='vdir --color=auto'
            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
fi

# Some suggestions for MOOS-IvP aliases
alias cdmi='cd ~/moos-ivp'
alias cdmm='cdmi; cd ivp/missions'
alias cdmma='cdmm; cd s1_alpha'
alias cdmis='cdmi; cd ivp/src'
alias runa='cdmma; pAntler alpha.moos'

# Misc Aliases
alias pingoe='ping 18.38.2.158'

# Blake's Additions
alias desktop="cd ~/Desktop"
alias fire="cd ~/moos-ivp-blerk/; ./build.sh; cd -"
alias logkill="rm -r -f MOOSLog_*/"
alias bwink="cd ~/moos-ivp-blerk/src/; ls"
alias rocky="cd ~/moos-ivp-blerk/missions/; ls"
alias duh1='du -d 1 -h'

#-------------------------------------------------------
# Set your Shell Prompt
#-------------------------------------------------------
PS1="\u: \w $ "    #add \h: to the front to show network
export PROMPT_DIRTRIM=3

#-------------------------------------------------------
# Dynamic IVP Behavior Loading
#-------------------------------------------------------
export IVP_BEHAVIOR_DIRS=/Users/bicole/GitHub/marine-autonomy/moos-ivp-bcole/lib

#-------------------------------------------------------
# Default Ubuntu Stuff
#-------------------------------------------------------
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# HISTORY
HISTCONTROL=ignoreboth # Exclude duplicate lines
shopt -s histappend    # Append; do not overwrite
HISTSIZE=1000          # Max length
HISTFILESIZE=2000      # Max file size

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
