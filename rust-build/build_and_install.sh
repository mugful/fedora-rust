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

RUST_VERSION=0.9

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# fetch and extract source
curl -O "http://static.rust-lang.org/dist/rust-$RUST_VERSION.tar.gz"
tar -xzf "rust-$RUST_VERSION.tar.gz"

# build
pushd "rust-$RUST_VERSION"
./configure
make
make install
popd

rm -rf "rust-$RUST_VERSION"
