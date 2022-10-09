#!/bin/bash
set -e

curl -fsSL "https://raw.githubusercontent.com/configcat/cli/main/scripts/install.sh" | bash -s -- -v=1.7.0

export CONFIGCAT_API_HOST=${configcat_api_host}

configcat scan "$BITRISE_SOURCE_DIR/${sub_folder}" \
    --config-id=${configcat_config_id} \
    --repo=${GIT_REPOSITORY_URL} \
    --line-count=${line_count} \
    --file-url-template="$GIT_REPOSITORY_URL/blob/{commitHash}/{filePath}#L{lineNumber}" \
    --commit-url-template="$GIT_REPOSITORY_URL/commit/{commitHash}" \
    --runner="Bitrise Step Scan Repository" \
    --upload \
    --verbose=${verbose} \
    --non-interactive
