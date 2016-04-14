#!/usr/bin/env bash
set -e

VERSION="7.8.4"
FILENAME="ghc-$VERSION-x86_64-unknown-linux-deb7.tar.xz"
DIRNAME="ghc-$VERSION"

# Get the GHC-compiler 7.8.4.
cd /tmp
wget https://www.haskell.org/ghc/dist/$VERSION/$FILENAME

# Unpack it.
tar xvf $FILENAME
cd $DIRNAME

# Install it
./configure
make install

# Clean up after outself.
cd /tmp
rm $DIRNAME -Rf
rm $FILENAME -f
