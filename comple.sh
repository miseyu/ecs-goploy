#!/bin/sh

set -e

XC_ARCH=${XC_ARCH:-amd64}
XC_OS=${XC_OS:-darwin linux}

rm -rf pkg/
gox \
    -os="${XC_OS}" \
    -arch="${XC_ARCH}" \
    -output "pkg/{{.OS}}_{{.Arch}}/{{.Dir}}"