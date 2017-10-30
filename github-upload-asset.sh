#!/bin/sh

for ARCHIVE in $(find ./pkg/dist -name "*.zip" -mindepth 1 -maxdepth 1); do
    ARCHIVE_NAME=$(basename ${ARCHIVE})
    CONTENT_TYPE=$(file --mime-type -b ${ARCHIVE})

    curl --fail -X POST https://uploads.github.com/repos/miseyu/ecs-goploy/releases/${RELEASE_ID}/assets?name=${ARCHIVE_NAME} \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Authorization: token ${GITHUB_TOKEN}" \
        -H "Content-Type: ${CONTENT_TYPE}" \
        --data-binary @"${ARCHIVE}"
done

