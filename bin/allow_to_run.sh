#!/bin/bash
# allow_to_run.sh — Remove macOS quarantine & ensure executables are chmod'd
set -euo pipefail

BIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$(cd "$BIN_DIR/.." && pwd)"

echo "💻 Ensuring all .sh scripts are executable..."
find "$BUNDLE_DIR" -type f -name "*.sh" -exec chmod +x {} \;

if [ -d "$BUNDLE_DIR/bin" ]; then
  echo "⚙️  Ensuring all binaries in bin/ are executable..."
  find "$BUNDLE_DIR/bin" -type f ! -name "*.sh" -exec chmod +x {} \;

  # Explicit chmod for key binaries
  if [ -f "$BUNDLE_DIR/bin/ffmpeg" ]; then
    chmod +x "$BUNDLE_DIR/bin/ffmpeg"
    echo "✅ chmod +x bin/ffmpeg"
  fi

  if [ -f "$BUNDLE_DIR/bin/whisper-cli" ]; then
    chmod +x "$BUNDLE_DIR/bin/whisper-cli"
    echo "✅ chmod +x bin/whisper-cli"
  fi
fi

echo "✅ Bundle is now runnable: $BUNDLE_DIR"
