export EDITOR=nano
export VISUAL=subl

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:/usr/local/share/pypy"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
