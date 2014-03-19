#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

source variables.sh

# install
pushd "rust-$RUST_VERSION"
make install
popd
