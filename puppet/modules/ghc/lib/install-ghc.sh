#!/usr/bin/env bash
set -e

VERSION="7.10.3"
FILENAME="ghc-${VERSION}b-x86_64-deb8-linux.tar.xz"
DIRNAME="ghc-$VERSION"

# Get the GHC-compiler 7.8.4.
cd /tmp
wget http://downloads.haskell.org/~ghc/$VERSION/$FILENAME

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
