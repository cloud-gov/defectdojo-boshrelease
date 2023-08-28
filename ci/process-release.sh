#!/bin/bash

# Start from clean src folder
rm -rf src/src/*

# BOSH release source code belongs in src directory
tar -xzf release/source.tar.gz --directory src/src

# Directory name changes with every release, so make it constant
ls src/src | xargs --replace=% mv % DefectDojo

# Create a topic branch named after the new version
git checkout -b defectdojo-$(cat release/version)

# bosh add-blob --dir=src release/source.tar.gz defectdojo/source.tar.gz
exit 1
