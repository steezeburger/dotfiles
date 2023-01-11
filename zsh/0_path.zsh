# path, the 0 in the filename causes this to load first

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

pathAppend "$HOME/.yadr/bin"
pathAppend "$HOME/.yadr/bin/yadr"
pathAppend "$HOME/.composer/vendor/bin"
pathAppend "/usr/local/opt/terraform@0.11/bin"
pathAppend "$HOME/.pyenv"
pathAppend "$HOME/.rvm/bin"
pathAppend "$HOME/.cargo/bin"

# pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

