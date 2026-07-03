#!/usr/bin/env bash
set -euo pipefail

HOME_DIR="${DEV_TEAM_DASHBOARD_HOME:-$HOME/.dev-team-dashboard}"
PARENT="$(dirname "$HOME_DIR")"
BASE="$(basename "$HOME_DIR")"
OUT="${1:-dev-team-dashboard-backup-$(date +%Y%m%d-%H%M%S).tar.gz}"

if [[ ! -d "$HOME_DIR" ]]; then
  echo "error: home dir not found: $HOME_DIR" >&2
  exit 1
fi

tar -czf "$OUT" -C "$PARENT" "$BASE"
echo "wrote $OUT"
