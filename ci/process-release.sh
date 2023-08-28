#!/bin/bash

rm -rf src/src/*
tar -xzvf release/source.tar.gz src/src
# bosh add-blob --dir=src release/source.tar.gz defectdojo/source.tar.gz
exit 1
