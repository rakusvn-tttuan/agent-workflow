#!/usr/bin/env bash
# T43-03: smoke test backup-dashboard-home.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SCRIPT="$ROOT/scripts/backup-dashboard-home.sh"
TMP_HOME="$(mktemp -d)"
TMP_OUT="$(mktemp -u).tar.gz"
trap 'rm -rf "$TMP_HOME" "$TMP_OUT"' EXIT

echo '{"projects":[]}' > "$TMP_HOME/projects.json"

DEV_TEAM_DASHBOARD_HOME="$TMP_HOME" bash "$SCRIPT" "$TMP_OUT"

if ! tar -tzf "$TMP_OUT" | grep -q 'projects.json'; then
  echo "error: tar does not contain projects.json" >&2
  exit 1
fi

echo "T43-03 ok"
