#!/bin/bash
#
# Builds the tutorial site into www/ and fails on any warning (broken xrefs, missing images,
# unresolved attributes). Antora reads the working copy of the checked-out branch, so
# uncommitted changes are included.
#
# Preview: open www/index.html, or serve the folder, for example `python3 -m http.server -d www`.

set -euo pipefail

if command -v antora >/dev/null 2>&1; then
  ANTORA=(antora)
else
  ANTORA=(npx --yes -p @antora/cli@3.1 -p @antora/site-generator@3.1 antora)
fi

rm -rf www
"${ANTORA[@]}" generate site.yml --to-dir www --log-failure-level=warn
echo "Site built in www/"
