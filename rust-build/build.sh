#!/bin/bash

set -exo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

source variables.sh

# fetch and extract source
curl -O "http://static.rust-lang.org/dist/rust-$RUST_VERSION.tar.gz"
tar -xzf "rust-$RUST_VERSION.tar.gz"

# build
pushd "rust-$RUST_VERSION"
./configure
make
popd
