#!/bin/bash
set -eo pipefail

git pull
bosh create-release --force
bosh upload-release
bosh -d defectdojo --non-interactive deploy deployment.yml
