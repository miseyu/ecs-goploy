#!/bin/sh

INPUT="
{
    \"tag_name\": \"${VERSION}\",
    \"target_commitish\": \"master\",
    \"draft\": false,
    \"prerelease\": false
}"

RELEASE_RESPONSE=$(
    curl --fail -X POST https://api.github.com/repos/miseyu/ecs-goploy/releases \
        -H "Accept: application/vnd.github.v3+json" \
        -H  "Authorization: token ${GITHUB_TOKEN}" \
        -H "Content-Type: application/json" \
        -d "${INPUT}")