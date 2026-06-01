#!/usr/bin/env bash
# Renders index.html -> cakeys-proposal.pdf using local headless Chrome
# (same Chromium print pipeline Pika used). No external services.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT="$DIR/cakeys-proposal.pdf"

"$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-pdf-header-footer \
  --virtual-time-budget=20000 \
  --run-all-compositor-stages-before-draw \
  --print-to-pdf="$OUT" \
  "file://$DIR/index.html" 2>/dev/null

echo "Rendered: $OUT"
