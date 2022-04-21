#!/bin/bash
set -e

curl -fsSL "https://raw.githubusercontent.com/configcat/cli/main/scripts/install.sh" | bash -s -- -v=1.4.1

export CONFIGCAT_API_HOST=${api_host}
export CONFIGCAT_API_USER=${api_user}
export CONFIGCAT_API_PASS=${api_pass}

configcat scan "$BITRISE_SOURCE_DIR/${sub_folder}" \
    --config-id=${config_id} \
    --repo=${GIT_REPOSITORY_URL} \
    --line-count=${line_count} \
    --file-url-template="$GIT_REPOSITORY_URL/blob/{commitHash}/{filePath}#L{lineNumber}" \
    --commit-url-template="$GIT_REPOSITORY_URL/commit/{commitHash}" \
    --runner="Bitrise Step Scan Repository" \
    --upload \
    --verbose=${verbose} \
    --non-interactive
