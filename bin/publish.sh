#!/bin/bash
set -e # exit with nonzero exit code if anything fails

gitbook update
gitbook --version
gitbook install
gitbook build

# Copy to S3
aws s3 sync --delete _book s3://tes-tech-docs/engineering
