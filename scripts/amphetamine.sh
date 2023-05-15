#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/helpers.sh"

main() {
	local opt_session_active
	local opt_session_on_icon
	local opt_session_off_icon

	opt_session_on_icon="$(get_tmux_option "@amphetamine_session_on_icon" "󰻂")"
	opt_session_off_icon="$(get_tmux_option "@amphetamine_session_off_icon" "󰻃")"
	opt_session_active="$("${CURRENT_DIR}/amphetamine.scpt")"

	if [[ "$opt_session_active" == "true" ]]; 
  then
    echo "$opt_session_on_icon"
  else
    echo "$opt_session_off_icon"
  fi;
}

main
