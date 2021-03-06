# .bash_profile

# Get the aliases and functions
# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc
# fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export PATH
