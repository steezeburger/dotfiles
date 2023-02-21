# Load any user customizations prior to load
#
if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi

#
# Import SSH key for forwarding
#
IDENTITIES=$(ssh-add -L)
if [ "$IDENTITIES" '==' 'The agent has no identities.' ]; then
  ssh-add -K ~/.ssh/id_rsa
  # codai git ssh
  ssh-add -K ~/.ssh/codai
fi

source ~/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/completion.zsh.inc'; fi


# nvm
# NOTE - removing this because it makes terminal initialisation so slow
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rvm
# NOTE - removing this because it makes terminal initialisation so slow
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# NOTE - removing this because it makes terminal initialisation so slow
#__conda_setup="$('/Users/jessesnyder/code/developer-tools/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/jessesnyder/code/developer-tools/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/jessesnyder/code/developer-tools/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/jessesnyder/code/developer-tools/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
