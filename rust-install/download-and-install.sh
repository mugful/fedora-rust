#!/bin/bash

#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

set -exo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

RUST_VERSION=$(cat rust-version | tr -d '\n')

# fetch and extract rust binary
curl -O "http://static.rust-lang.org/dist/rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf "rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz"

# install rust
pushd "rust-$RUST_VERSION-x86_64-unknown-linux-gnu"
./install.sh
popd

rm -rf "rust-$RUST_VERSION-x86_64-unknown-linux-gnu"


CARGO_VERSION=nightly

# fetch and extract cargo binary
curl -O "http://static.rust-lang.org/cargo-dist/cargo-$CARGO_VERSION-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf "cargo-$CARGO_VERSION-x86_64-unknown-linux-gnu.tar.gz"

# install cargo
pushd "cargo-$CARGO_VERSION-x86_64-unknown-linux-gnu"
./install.sh
popd

rm -rf "cargo-$CARGO_VERSION-x86_64-unknown-linux-gnu"
