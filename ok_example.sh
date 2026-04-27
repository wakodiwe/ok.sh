#!/usr/bin/env sh
# example.sh - Example script
#
# Test with:
#   ./test_ok_example.sh
# or:
#   make test

set -euf

progname="${0##*/}"
VERSION=0.1.0

msg() {
    printf "%b\n" "${1}" >&2
}
die() {
    msg "${1}"; exit 1
}

usage() {
    cat <<EOF
Usage: ${progname} [OPTIONS] COMMAND

Commands:
  run              Run run command

Options:
  -h, --help       Show this help and exit
  -V, --version    Show version and exit
EOF
exit "${1:-0}"
}

main() {
    [ "$#" -eq 0 ] && usage 1
    case "$1" in
        run) msg "exec run cmd" ;;
        -h|--help) usage 0 ;;
        -V|--version) msg "${VERSION}"; exit 0 ;;
        *) msg "${progname}: command not found: ${1}"; usage 1 ;;
    esac
}

main "${@}"
