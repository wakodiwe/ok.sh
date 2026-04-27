#!/usr/bin/env sh
# install.sh - Install ok.sh

set -euf

PREFIX="${PREFIX:-$HOME/.local}"
DEST="$PREFIX/lib/ok.sh"
URL="https://raw.githubusercontent.com/wakodiwe/ok.sh/main/ok.sh"

mkdir -p "$(dirname "$DEST")"
curl -fsSL "$URL" -o "$DEST"
chmod 644 "$DEST"

printf "Installed to %s\n" "$DEST"
printf "Usage: . %s\n" "$DEST"
