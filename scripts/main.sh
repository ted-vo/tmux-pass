#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

source "./utils.sh"

main() {
	local IFS=$'\n'
	local prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"

	key=$(find -L "$prefix" -type f -iname "*.gpg" | sed -e "s#${prefix}/\{0,1\}##" -e "s#\.gpg##" | sort | fzf --no-multi) || return

	password=$(pass show "$key")

  if [[ "${TMUX_OPTS[@bw-copy-to-clipboard]}" == "on" ]]; then
    cp_to_clipboard "$password"
  else
    # Send the password in the last pane.
    tmux send-keys -t ! "$password"
  fi
}

main "$@"
