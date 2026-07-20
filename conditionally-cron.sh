#!/bin/bash

git pull

CURRENT_COMMIT=$(git rev-parse --short HEAD)
if [[ ! -f .last-commit ]]; then
  touch .last-commit
fi
LAST_COMMIT=$(cat .last-commit)
if [[ "$CURRENT_COMMIT" = "$LAST_COMMIT" ]]; then
  echo "Changes already applied. Halt."
  exit 0
fi

# ansible-playbook configure_olympus.yml
echo "Here is where we would do the change"
if [[ $? -ne 0 ]]; then
  echo "Failed to apply changes. Exiting."
  exit 1
fi

echo "Changes applied successfully."
echo "$CURRENT_COMMIT" >.last-commit
