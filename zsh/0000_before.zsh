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
if [ "$IDENTITIES" == 'The agent has no identities.' ]; then
  ssh-add -K ~/.ssh/id_rsa
fi

source ~/.iterm2_shell_integration.zsh

# custom from js
source $(brew --prefix nvm)/nvm.sh
