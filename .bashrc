# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

function fortuneFn(){
echo "=================== Quote of the Day ====================="
echo ""
fortune
echo ""
echo "=========================================================="
echo ""
}

function dictFn(){

  dict $1|head -15|more +6

}

alias d="dictFn"

alias f="fortuneFn"

alias m="sudo mount 192.168.1.16:/volume1/disk /mnt/nfs"
alias ni="source ~/.nvm/nvm.sh && nvm use iojs"
alias tf="synclient TouchpadOff=1"
alias to="synclient TouchpadOff=0"
alias s="ssh -D 7070 dpat.net"
alias s1="ssh -D 7070 ruanyfv2"
f

echo "Command Alias List"
printf "(d)\t%s\n" "Dict"
printf "(f)\t%s\n" "fortune"
printf "(m)\t%s\n" "Mount NFS"
printf "(tf)\t%s\n" "Disable the touchpad"
printf "(to)\t%s\n" "Enable the touchpad"
printf "(s)\t%s\n" "SSH"
printf "\n"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* \(.*\)/(\1)/'
}

export PS1="\[\e[01;37m\]\A\[\e[0m\]\[\e[00;37m\] [\[\e[0m\]\[\e[01;35m\]\u\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;36m\]\w\[\e[0m\]\[\e[00;37m\]\[\e[01;31m\]\$(parse_git_branch)\[\e[0m\]\[\e[00;37m\]] \\$ \[\e[0m\]"
export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/bin:/usr/local/games:/usr/games:~/.cabal/bin

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export PATH=$PATH:/home/ruanyf/tools/flow/
export PATH=~/npm/bin:~/.node_modules/bin:$PATH
export PATH=$PATH:~/bin
export PATH=/home/ruanyf/.node_modules/bin:$PATH
export JAVA_HOME='/usr/lib/jvm/java-7-openjdk-amd64/'

. ~/.nvm/nvm.sh

# update git
gup ()
{
	local mymessage="next update";

	# if $1 not zero length
	if [ ! -z "$1" ]; then
		mymessage=$1
	fi 

	git add .
	git commit -m "$mymessage"
	git push
}

# if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bindings/bash/powerline.sh
# fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.nvm/nvm.sh
nvm use iojs
