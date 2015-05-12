if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
export PGDATA=/usr/local/var/postgres

alias ls='ls -G'

#git complete
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
