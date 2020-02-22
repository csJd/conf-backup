# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# added by Miniconda3 installer
export PATH="/opt/bin:$PATH"
export PATH="/opt/miniconda3/bin:$PATH"

# set homebrew mirror to tuna
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# set locale to en_US
export LC_ALL='en_US.UTF-8'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# use brew gcc-7 instead of clang
alias gcc='gcc-7'
alias g++='g++-7'

# for mono
export MONO_GAC_PREFIX="/usr/local"


