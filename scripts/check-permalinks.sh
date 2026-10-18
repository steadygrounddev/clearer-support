#!/usr/bin/env bash
# Fails if any URL listed in permalinks.txt is missing from the built site.
set -euo pipefail

site_dir="${1:-_site}"
manifest="$(dirname "$0")/../permalinks.txt"
missing=0

while IFS= read -r path || [ -n "$path" ]; do
  [ -z "$path" ] && continue
  case "$path" in
    */) file="$site_dir${path}index.html" ;;
    *)  file="$site_dir$path" ;;
  esac
  if [ ! -f "$file" ]; then
    echo "Missing published URL: $path (expected $file)" >&2
    missing=1
  fi
done < "$manifest"

exit $missing
