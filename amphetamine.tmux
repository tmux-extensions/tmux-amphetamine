#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/helpers.sh"

amphetamine_status="#(${CURRENT_DIR}/scripts/amphetamine.sh)"
amphetamine_status_interpolation_string="\#{amphetamine_status}"

do_interpolation() {
	local content=$1

	content=${content/$amphetamine_status_interpolation_string/$amphetamine_status}

	echo "$content"
}

update_tmux_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(get_tmux_option "$option")"
	new_option_value="$(do_interpolation "$option_value")"

	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

main
