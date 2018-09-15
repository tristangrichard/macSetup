# Reboot or do something else
function reboot_or() {
  echo "Do you want to reboot now? (y/n)"

  read choice
  case ${choice} in
    y | Yes | yes ) echo "Yes"; sudo reboot;; # If y | yes, reboot
    n | N | No | no) echo "No"; return 1;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Symlink file if they do not exists
function symlink_file() {
  if [ ! -f $2 ]; then
    if [ ! -d $2 ]; then
      ln -s $1 $2
    else
      echo "'${2}' already exists"
    fi
  else
    echo "'${2}' already exists"
  fi
}

# Ask yes|no questions
ask() {
    # https://djm.me/ask
    local prompt default REPLY

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}
