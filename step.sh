#!/bin/bash
set -e

curl -fsSL "https://raw.githubusercontent.com/configcat/cli/main/scripts/install.sh" | bash -s -- -v=2.3.3

export CONFIGCAT_API_HOST=${configcat_api_host}
export CONFIGCAT_ALIAS_PATTERNS=${alias_patterns}
export CONFIGCAT_USAGE_PATTERNS=${usage_patterns}

EXCLUDE_FLAG_KEYS="' '"
[ ! -z "${exclude_keys}" ] && EXCLUDE_FLAG_KEYS=${exclude_keys}

configcat scan "$BITRISE_SOURCE_DIR/${sub_folder}" \
    --config-id=${configcat_config_id} \
    --repo=${GIT_REPOSITORY_URL} \
    --line-count=${line_count} \
    --file-url-template="$GIT_REPOSITORY_URL/blob/{commitHash}/{filePath}#L{lineNumber}" \
    --commit-url-template="$GIT_REPOSITORY_URL/commit/{commitHash}" \
    --runner="Bitrise Step Scan Repository" \
    --upload \
    --verbose=${verbose} \
    --non-interactive \
    --exclude-flag-keys ${EXCLUDE_FLAG_KEYS}
