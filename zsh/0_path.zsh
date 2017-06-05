# path, the 0 in the filename causes this to load first

path=(
  $path
  $HOME/.yadr/bin
  $HOME/.yadr/bin/yadr
  $HOME/code/developer_tools/android-sdk-linux/tools
  $HOME/pear/bin
  $HOME/anaconda3/bin
)

#
# If you have duplicate entries on your PATH, run this command to fix it:
# PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

pathAppend "$HOME/.yadr/bin"
pathAppend "$HOME/.yadr/bin/yadr"
