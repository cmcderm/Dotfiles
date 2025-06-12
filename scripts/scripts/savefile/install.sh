#!/usr/bin/env bash

./uninstall.sh

cargo build --release

sudo cp ./target/release/savefile /usr/bin