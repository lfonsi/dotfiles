PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin #brew coreutils normal names

source ~/.scripts/.git-completion.bash

#git current branch prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u: \w \[\033[4;97m\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \$ "

source ~/.dotfiles/.alias
