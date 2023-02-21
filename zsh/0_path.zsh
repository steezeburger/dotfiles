# path, the 0 in the filename causes this to load first

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

PATH="$PATH:$HOME/.yadr/bin:$HOME/.yadr/bin/yadr:$HOME/.pyenv:$HOME/.yarn/bin:$HOME/.cargo/bin"

# FIXME - needed?
#pathAppend "$HOME/.config/yarn/global/node_modules/.bin"

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
