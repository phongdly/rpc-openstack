#!/bin/bash

## Shell Opts ----------------------------------------------------------------

set -euv
set -o pipefail

## Vars ----------------------------------------------------------------------

export DEPLOY_AIO="true"

# Set the apt artifact mode
if [[ ${RE_JOB_IMAGE} =~ loose$ ]]; then
  export RPCO_APT_ARTIFACTS_MODE="loose"

  # Upgrade all packages to test the absolute
  # latest packages when testing this mode.
  apt-get update && apt-get upgrade
fi

## Functions -----------------------------------------------------------------

## Main ----------------------------------------------------------------------

# Run the deployment script
bash -c "$(readlink -f $(dirname ${0})/../../scripts/deploy.sh)"
