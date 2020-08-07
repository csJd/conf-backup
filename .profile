# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set homebrew mirror to tuna
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tencent.com/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=1

# set locale to en_US
export LC_ALL='en_US.UTF-8'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# use brew gcc-6 instead of clang
alias gcc='gcc-6'
alias g++='g++-6'
