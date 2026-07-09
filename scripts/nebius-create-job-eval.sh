#!/bin/bash

PROFILE=dolevelb
REPO_URL=https://github.com/dolevelbaz/apex-architects-ex-1.git
REPO_NAME=apex-architects-ex-1

HF_TOKEN=hf_...
HF_REPO_ID=dolevelb/apex-gpt2-run

CHECKPOINT_FILE=model_04999.pt

set +x

nebius ai job create \
	--name ex1-eval-${PROFILE} \
	--image cr.eu-north1.nebius.cloud/e00v1er5fasm8gmdwy/apex-ex-1 \
	--container-command bash \
    --args "-c \"git clone ${REPO_URL} && cd ${REPO_NAME} && python eval_hellaswag.py --hf-repo ${HF_REPO_ID} --hf-file ${CHECKPOINT_FILE}\"" \
	--platform gpu-l40s-d \
	--preset 1gpu-16vcpu-96gb \
	--timeout 15m \
	--env HF_TOKEN=${HF_TOKEN} \
	--volume computefilesystem-e00hnnpfn5rr5aavma:/mnt/data

set -x

