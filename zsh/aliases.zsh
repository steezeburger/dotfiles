# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias l='ls -h --color=auto'
  alias ll='ls -lh --color=auto'
  alias la='ls -ah --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
  alias l='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# pulumi aliases
alias pluss='pulumi stack select'
alias plucg='pulumi config get'
alias plucs='pulumi config set'
alias plucss='pulumi config set --secret'

# Git Aliases
alias gs='git status'
alias gco='git co'
alias gpl='git pull'
alias gnb='git nb' # new branch aka checkout -b
# alias gb='git --no-pager b'
alias gb='git branch'
alias gd='git diff'
# commit added files and takes message as next arg, e.g. gcam "fixed a few things"
alias gcam='git commit -am'
# git log stuff
alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gls='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
alias glo='git log --topo-order --pretty=format:"${_git_log_oneline_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias glb='git log --topo-order --pretty=format:"${_git_log_brief_format}"'
alias glc='git shortlog --summary --numbered'
# git remote stuff
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# kill
alias ka9='killall -9'
alias k9='kill -9'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

# Custom - steezeburger
alias pe='vim $yadr/zsh/0_path.zsh' #path edit
alias dcr='docker-compose run --rm'
alias dcp='docker-compose'
# copy last command to clipboard
alias lcp='fc -ln -1 | pbcopy'
# copy current directory to clipboard
alias cpwd='pwd | pbcopy'

# NOTE - old ruby/rake/gem stuff i don't need anymore

#alias dbtp='spring rake db:test:prepare'
#alias dbm='spring rake db:migrate'
#alias dbmr='spring rake db:migrate:redo'
#alias dbmd='spring rake db:migrate:down'
#alias dbmu='spring rake db:migrate:up'

#alias rdm='rake db:migrate'
#alias rdmr='rake db:migrate:redo'

# Zeus
#alias zs='zeus server'
#alias zc='zeus console'
#alias zr='zeus rspec'
#alias zrc='zeus rails c'
#alias zrs='zeus rails s'
#alias zrdbm='zeus rake db:migrate'
#alias zrdbtp='zeus rake db:test:prepare'
#alias zzz='rm .zeus.sock; pkill zeus; zeus start'

# Rspec
#alias rs='rspec spec'
#alias sr='spring rspec'
#alias src='spring rails c'
#alias srgm='spring rails g migration'
#alias srdm='spring rake db:migrate'
#alias srdt='spring rake db:migrate'
#alias srdmt='spring rake db:migrate db:test:prepare'

# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
#alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
#alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

# Gem install
#alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
#alias todo='open nvalt://find/todo'

# Ruby
#alias c='rails c' # Rails 3
#alias co='script/console' # Rails 2
#alias cod='script/console --debugger'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
#alias ts='thin start -a ${VM_IP:-127.0.0.1}'
#alias ms='mongrel_rails start'
#alias tfdl='tail -f log/development.log'
#alias tftl='tail -f log/test.log'
