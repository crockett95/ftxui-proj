#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------
#
set -e

DOXYGEN_VERSION=${1:-"none"}

if [ "${DOXYGEN_VERSION}" = "none" ]; then
    echo "No Doxygen version specified, skipping Doxygen reinstallation"
    exit 0
fi

# Cleanup temporary directory and associated files when exiting the script.
cleanup() {
    EXIT_CODE=$?
    set +e
    if [[ -n "${TMP_DIR}" ]]; then
        echo "Executing cleanup of tmp files"
        rm -Rf "${TMP_DIR}"
    fi
    exit $EXIT_CODE
}
trap cleanup EXIT


echo "Installing Doxygen..."
mkdir -p /opt/doxygen

DOXYGEN_BINARY_NAME="doxygen-${DOXYGEN_VERSION}.linux.bin.tar.gz"
TMP_DIR=$(mktemp -d -t doxygen-XXXXXXXXXX)

echo "${TMP_DIR}"
cd "${TMP_DIR}"

# https://github.com/doxygen/doxygen/releases/download/Release_1_10_0/doxygen-1.10.0.linux.bin.tar.gz
curl -sSL "https://github.com/doxygen/doxygen/releases/download/Release_${DOXYGEN_VERSION//./_}/${DOXYGEN_BINARY_NAME}" | tar xzf -

cd "$TMP_DIR/doxygen-${DOXYGEN_VERSION}"
make install
# sh "${TMP_DIR}/${DOXYGEN_BINARY_NAME}" --prefix=/opt/doxygen --skip-license
