#!/bin/bash

PROFILE=dolevelb
REPO_URL=https://github.com/dolevelbaz/apex-architects-ex-1.git
REPO_NAME=apex-architects-ex-1

HF_TOKEN=hf_...
HF_REPO_ID=dolevelb/apex-gpt2

set +x

nebius ai job create \
	--name ex1-ddp-${PROFILE} \
	--image cr.eu-north1.nebius.cloud/e00v1er5fasm8gmdwy/apex-ex-1 \
	--container-command bash \
	--args "-c \"git clone ${REPO_URL} && cd ${REPO_NAME} && torchrun --standalone --nproc_per_node=8 train_gpt2.py\"" \
    --platform gpu-h100-sxm \
    --preset 8gpu-128vcpu-1600gb \
	--timeout 30m \
	--env HF_TOKEN=${HF_TOKEN} \
	--env HF_REPO_ID=${HF_REPO_ID} \
    --volume computefilesystem-e00hnnpfn5rr5aavma:/mnt/data \
    --volume computefilesystem-e00yzm564mmdvedbsj:/mnt/models

set -x

