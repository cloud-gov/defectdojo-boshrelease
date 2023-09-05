#!/bin/bash
set -eo pipefail

cd src
bosh add-blob --dir=src release/source.tar.gz defectdojo/source.tar.gz

##########################


# Directory name changes with every release, so make it constant
ls src/src | xargs --replace=% mv src/src/% src/src/DefectDojo

DEFECTDOJO_VERSION=$(cat release/version)

# Token set as GH_TOKEN is automatically used. See `gh help environment`.
echo "Logging into GitHub"
gh auth login --hostname github.com
echo "Configuring Git"
gh auth setup-git --hostname github.com
git config --global user.email "cloud-gov-operations@gsa.gov"
git config --global user.name "cloud.gov CI Bot"

# With authentication done, print commands
set +x
# Create a topic branch named after the new version
cd src
git checkout -b defectdojo-$DEFECTDOJO_VERSION

# Commit changes
git add src
git commit -m "Bump Defect Dojo to $DEFECTDOJO_VERSION"

# Push to a new branch
git push --set-upstream origin $(git branch --show-current)

gh pr create \
	--base main \
	--fill \
	--reviewer "@cloud-gov/platform-ops"

# bosh add-blob --dir=src release/source.tar.gz defectdojo/source.tar.gz
exit 1
