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

# brew bash completion
# NOTE - this doesn't work, but i think it's been replaced by git-completion.zsh
#if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi

# rust stuff
. "$HOME/.cargo/env"

# pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
