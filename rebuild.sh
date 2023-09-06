git pull
bosh create-release --force
bosh upload-release
bosh -d defectdojo deploy deployment.yml
