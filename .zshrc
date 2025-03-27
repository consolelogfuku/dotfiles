# postgres
export PATH=$PATH:/opt/homebrew/opt/libpq/bin
# mysql
export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin
export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin/mysql/bin
# node
export PATH=$HOME/.nodebrew/current/bin:$PATH
# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.volta/bin:$PATH"

# Fultter
export PATH=$HOME/flutter/bin:$PATH

# Android SDK
export ANDROID_HOME=/Users/fukumasasugawa/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# rbenv
eval "$(rbenv init - zsh)"

# docker alias
alias dc='docker compose'

# neovim alias
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

# rails
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

