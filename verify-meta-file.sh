#!/usr/bin/bash

set -e

METAFILE=$1

die() { echo "ERROR $@" >&2 ; exit 42 ; }
has() { echo "Checking for '$@'" ; egrep "^$@$" $METAFILE || die "Missing/Invalid: '$@'" ; }

[[ -n $METAFILE ]] || die "No metafile given, usage: $0 METAFILE"
[[ -f $METAFILE ]] || die "metafile '$METAFILE' does not exist"

echo "Starting checks …"

# Match Fedora and CentOS versioning
has "PLATFORM_VERSION=[0-9]+([.][0-9]+)?"
has "PLATFORM_RELEASE=[0-9]+([.][0-9]+)?"
has "OVIRT_VERSION=[3][.][45]([.][0-9]+)?"
has "OVIRT_RELEASE=[0-9]+"

echo "Passed successfully."