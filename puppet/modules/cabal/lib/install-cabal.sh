#!/usr/bin/env bash
set -e

# Install under cabal user.
export HOME="/home/cabal"

VERSION="1.22.4.0"
FILENAME="cabal-install-$VERSION"

# Download cabal.
cd /tmp
wget http://hackage.haskell.org/package/$FILENAME/$FILENAME.tar.gz

# Unpack it.
tar xvf $FILENAME.tar.gz
cd $FILENAME

# Install it.
./bootstrap.sh

# Change ownership of installed folder.
chown cabal:cabal $HOME/.cabal -R

# Clean up after outself.
cd /tmp
rm $FILENAME -Rf
rm $FILENAME.tar.gz -f
