#
# Import SSH key for forwarding
#
IDENTITIES=$(ssh-add -L)
if [ "$IDENTITIES" '==' 'The agent has no identities.' ]; then
  ssh-add -K ~/.ssh/id_ed25519
fi

# source ~/.iterm2_shell_integration.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jessesnyder/code/developer-tools/google-cloud-sdk/completion.zsh.inc'; fi

# brew bash completion
# NOTE - this doesn't work, but i think it's been replaced by git-completion.zsh
#if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi

# kubectl bash completion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# rust stuff
. "$HOME/.cargo/env"

# we want to save history
unsetopt histignorealldups
unsetopt histignoredups
unsetopt histsavenodups

# atuin
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# set user var for iterm2 so we can display it in the status bar
# function iterm2_print_user_vars() {
#   iterm2_set_user_var kubecontext $(kubectl config current-context):$(kubectl config view --minify --output 'jsonpath={..namespace}')
# }

# startup iterm shell integration
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# set iterm2 profile to "tim" which uses high contrast colors
function setProfileToTim() {
  echo -e "\033]50;SetProfile=tim\a"
}
