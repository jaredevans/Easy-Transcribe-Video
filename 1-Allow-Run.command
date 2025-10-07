#!/bin/bash
# Allow-Run.command — Double-clickable helper to prep and run allow_to_run.sh
set -euo pipefail

# Get the directory where this .command file lives (the bundle root)
BUNDLE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🔐 Clearing quarantine and making bundle executable..."
xattr -dr com.apple.quarantine "$BUNDLE_DIR" || true

# Ensure .command files are executable
for cmd in "$BUNDLE_DIR/2-Download-Model.command" "$BUNDLE_DIR/Transcribe.command"; do
  if [ -f "$cmd" ]; then
    chmod +x "$cmd"
    echo "✅ chmod +x $(basename "$cmd")"
  fi
done

# Run the allow_to_run.sh inside bin/
if [ -x "$BUNDLE_DIR/bin/allow_to_run.sh" ]; then
  /bin/bash "$BUNDLE_DIR/bin/allow_to_run.sh"
else
  echo "❌ Error: $BUNDLE_DIR/bin/allow_to_run.sh not found or not executable"
  exit 1
fi

# Notify the user visually on macOS
/usr/bin/osascript -e 'display notification "Bundle is ready to use." with title "Transcribe Setup"'
/usr/bin/osascript -e 'display dialog "✅ All set! You can now run Transcribe." buttons {"OK"} with icon note giving up after 10'
