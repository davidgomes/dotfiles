#!/bin/bash

# ChatGPT 4o wrote this entire code.

# File containing the list of extensions
EXTENSIONS_FILE="vscode/extensions.txt"

# Check if the extensions file exists
if [[ ! -f "$EXTENSIONS_FILE" ]]; then
  echo "Extensions file not found: $EXTENSIONS_FILE"
  exit 1
fi

# Loop through each line in the file and install the extension
while IFS= read -r extension || [[ -n "$extension" ]]; do
  if [[ -n "$extension" && ! "$extension" =~ ^# ]]; then
    echo "Installing extension: $extension"
    cursor --install-extension "$extension"
  fi
done < "$EXTENSIONS_FILE"

echo "All extensions installed."
