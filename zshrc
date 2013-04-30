export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
ZSH=$HOME/.oh-my-zsh
export editor="vi"
eval "$(fasd --init posix-alias zsh-hook)"
ZSH_THEME="robbyrussell"


# alias
#
alias fastme="sudo rm -rf /var/log/asl/*.asl"
alias mvim="/Applications/mvim"
alias -s git="git clone"
alias b='bundle'
alias ab="/usr/local/bin/ab"
alias zshs="source ~/.zshrc"
alias zshc="vi ~/.zshrc"
alias m="mongo"
alias ber="bundle exec rspec"
alias be="bundle exec"
alias k="nocorrect knife"
alias ksn="nocorrect knife search node"
alias -g K9=" kill -9 "
alias -g ND='*(/om[1])' # newest directory
alias -g NF='*(.om[1])' # newest file
alias -g G=" | grep --color"
alias -g X=" | xargs "
alias -g MP="--shell ~/MongoPlus/plus.js"
alias -g E="exec"
alias -g I='install'
alias  la="ls -all"
alias v="f -e vim"
alias c='fasd_cd -di'

alias lockme='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

o () { cat ~/conf/servers | grep -i "$1" |  awk '{print $2}' | xargs open }
url () { cat ~/conf/servers | grep -i "$1" |  awk '{print $2}' }


# no history for ls and cd
alias ls=' ls'
alias cd=' cd'

alias casdel="rm -rf spec/cassettes && rake spec"
alias ggcc="git checkout features/cassettes/ spec/cassettes/"

bindkey "^R" history-incremental-pattern-search-backward
alias pgrep=pgrepfunc
bindkey "^S" history-incremental-pattern-search-forward
bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

pgrepfunc(){ps aux | grep $1 | awk '{print $2}'}


go(){open "https://duckduckgo.com/?q=$*"}

# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(git extract ruby vi-mode rake  osx history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/bin:$HADOOP_HOME/bin/:/Users/sumit/.rvm/gems/ruby-1.9.3-p194/bin:/Users/sumit/.rvm/gems/ruby-1.9.3-p125@iba2/bin:/Users/sumit/.rvm/gems/ruby-1.9.3-p125@global/bin:/Users/sumit/.rvm/rubies/ruby-1.9.3-p125/bin:/Users/sumit/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/share/npm/bin
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git svn
precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{cyan}]%f'
  } else {
  zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{red}●%f%F{cyan}]%f'
}

vcs_info
}

## Detects the VCS and shows the appropriate sign
function prompt_char {
git branch >/dev/null 2>/dev/null && echo '±' && return
hg root >/dev/null 2>/dev/null && echo '☿' && return
svn info >/dev/null 2>/dev/null && echo '⚡' && return
echo '%#'
}

### Needed for a pretty prompt
setopt prompt_subst # Enables additional prompt extentions
autoload -U colors && colors # Enables colours


### My default prompt
PROMPT='%(!.%B%U%F{blue}%n%f%u%b.%F{blue}%n%f) at %F{magenta}%m%f on %F{yellow}%y%f in %F{cyan}%~%f
{${vcs_info_msg_0_} %(!.%F{red}$(prompt_char)%f.$(prompt_char)) }: %{$reset_color%}'
### My default prompt's right side
#RPROMPT='%F{cyan}%D{}%f%{$reset_color%}'

RPROMPT='%F{red}$(vi_mode)%{$reset_color%} %* $(battery)'


function vi_mode(){
  echo ${${KEYMAP/(main|viins)/>> }/(vicmd)/}${${KEYMAP/vicmd/<< }/(main|viins)/} 2>/dev/null
}

function battery(){
  echo `python ~/battery.py` 2>/dev/null
}
### My prompt for loops
PROMPT2='{%_} '

### My prompt for selections
PROMPT3='{ … } '

### So far I don't use "setopt xtrace", so I don't need this prompt
#PROMPT4=''

__rvm_project_rvmrc
PATH=$JRUBY_HOME/bin:$PATH
#source ~/liquidprompt/liquidprompt
#

export EC2_HOME=/usr/local/Cellar/ec2-api-tools/1.6.6.0/
export EC2_AMITOOL_HOME=/usr/local/Cellar/ec2-ami-tools/1.4.0.7
export AWS_ACCESS_KEY=""
export AWS_SECRET_KEY=your_AWS_SECRET_KEY
export EC2_PRIVATE_KEY=/Users/sumit/.ec2/pk-sumit.pem
export EC2_CERT=/Users/sumit/.ec2/cert-sumit.pem
export NODE_PATH="/usr/local/lib/node"

export JRUBY_OPTS='--1.9'
export RUBYOPT=-Ku
export HISTSIZE=1000000
source  ~/conf/functions.sh
setopt BRACE_CCL
export HADOOP_HOME=~/hadoop

