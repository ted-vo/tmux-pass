#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

source "./utils.sh"

main() {
	declare -A TMUX_OPTS=(
		["@pass-copy-to-clipboard"]=$(get_tmux_option "@pass-copy-to-clipboard" "off")
	)

	local IFS=$'\n'
	local prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"

	key=$(find -L "$prefix" -type f -iname "*.gpg" | sed -e "s#${prefix}/\{0,1\}##" -e "s#\.gpg##" | sort | fzf --no-multi) || return

	password=$(pass show "$key" | head -n 1)

	if [[ "${TMUX_OPTS[@pass-copy-to-clipboard]}" == "on" ]]; then
	  cp_to_clipboard "$password"
	else
	  # Send the password in the last pane.
	  tmux send-keys -t ! "$password"
	fi
}

main "$@"
