#!/bin/bash
set -u

cd "$(dirname "$0")"

echo "Embedding world.jpg texture into weather-os.html..."

if python3 embed_texture.py; then
  if [ -f "embed_done.txt" ] && grep -q '^SUCCESS' embed_done.txt; then
    echo "Success! Opening weather-os.html..."
    xdg-open weather-os.html >/dev/null 2>&1 || {
      echo "Could not launch a browser automatically. Open weather-os.html manually."
    }
  else
    echo "Something went wrong. Check embed_done.txt."
    exit 1
  fi
else
  echo "Something went wrong. Check embed_done.txt."
  exit 1
fi
