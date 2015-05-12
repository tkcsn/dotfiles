# java
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home/'
#export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home'

# maven
MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"

# vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# git
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@\h \W]$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
export PATH=$PATH:/Users/tsano/.nodebrew/current/bin
