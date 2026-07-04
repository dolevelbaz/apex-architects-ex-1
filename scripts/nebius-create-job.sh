#!/bin/bash

PROFILE=dolevelb
REPO_URL=https://github.com/dolevelbaz/apex-architects-ex-1.git
REPO_NAME=apex-architects-ex-1

set +x

nebius ai job create \
	--name ex1-${PROFILE} \
	--image cr.eu-north1.nebius.cloud/e00v1er5fasm8gmdwy/apex-ex-1 \
	--container-command bash \
	--args "-c \"git clone ${REPO_URL} && cd ${REPO_NAME} && python train_gpt2.py\"" \
	--platform gpu-l40s-d \
	--preset 1gpu-16vcpu-96gb \
	--timeout 20m \
	--volume computefilesystem-e00hnnpfn5rr5aavma:/mnt/data

set -x

