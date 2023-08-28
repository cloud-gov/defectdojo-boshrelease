#!/bin/bash

# Start from clean src folder
rm -rf src/src/*

# BOSH release source code belongs in src directory
tar -xzf release/source.tar.gz --directory src/src

# Directory name changes with every release, so make it constant
ls src/src | xargs --replace=% mv src/src/% src/src/DefectDojo

DEFECTDOJO_VERSION=$(cat ../release/version)

# Create a topic branch named after the new version
cd src
git checkout -b defectdojo-$DEFECTDOJO_VERSION

# Commit changes
git add src
git commit -m "Bump Defect Dojo to $DEFECTDOJO_VERSION"

# Push to a new branch
git push -u origin $(git branch --show-current)

# Token set as GH_TOKEN is automatically used. See `gh help environment`.
gh auth login

gh pr create \
	--base main \
	--fill \
	--reviewer "@cloud-gov/platform-ops"

# bosh add-blob --dir=src release/source.tar.gz defectdojo/source.tar.gz
exit 1
