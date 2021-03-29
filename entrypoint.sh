#!/bin/bash

version_arg=""
if [ "${ITCHIO_VERSION}" != "" ]; then
  version_arg="--userversion ${ITCHIO_VERSION}"
fi

echo
echo "-- Uploading ${ITCHIO_PATH} to ${ITCHIO_PROJECT}"
echo "butler push ${ITCHIO_PATH} ${version_arg} ${ITCHIO_PROJECT}:${ITCHIO_CHANNEL}"
/butler/butler push ${ITCHIO_PATH} ${ITCHIO_PROJECT}:${ITCHIO_CHANNEL} ${version_arg}