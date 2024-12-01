#!/bin/bash

ENV_FILE=".env"

if [[ ! -f "$ENV_FILE" ]]; then
    echo "File $ENV_FILE not found!"
    exit 1
fi

set -o allexport
# shellcheck source=.env
# shellcheck disable=SC1091
source <(awk -F= '/^[^#]/ && NF == 2 { gsub(/^ +| +$/, "", $1); gsub(/^ +| +$/, "", $2); printf("%s=\"%s\"\n", $1, $2) }' "$ENV_FILE")
set +o allexport

echo "The $ENV_FILE credential variables have been set."
