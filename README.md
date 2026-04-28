# defectdojo-boshrelease

This is a bosh release for deploying DefectDojo. It incorporates a fork of the [godojo](https://github.com/cloud-gov/godojo) installer for DefectDojo. When deployed, this bosh release brings up a working DefectDojo server with celery workers and a uwsgi server.

The DefectDojo server also requires a postgresql database which the godojo installer configures when given appropriate permissions.

## Why DefectDojo?

To comply with security and compliance requirements, such as container scanning, a robust vulnerability tracking and reporting tool is essential. DefectDojo meets this need by integrating with a wide variety of security tools, providing comprehensive vulnerability tracking and compliance benchmark capabilities. It offers customer report and metrics generation, delivering essential visibility into the system and facilitating quicker remediation of security findings.

## Current Usage

We currently use DefectDojo to consolidate and analyze the grype CVE scans of our container images, as well as the Nessus Vulnerability scans for our VMs.

## Notes

The bosh release blobs are handled in the same manner as other blobs used by Cloud.gov.

The `godojo` job is responsible for running the godojo installer for setting up DefectDojo.
The `nginx_dojo` job is responsible for setting up the nginx server.

All credentials and secrets are defined using `Credhub` values.
