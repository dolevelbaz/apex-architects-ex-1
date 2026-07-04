#!/bin/bash

PROFILE=dolevelb

set +x

nebius ai job create \
	--name smoke-test-${PROFILE} \
	--image cr.eu-north1.nebius.cloud/e00v1er5fasm8gmdwy/apex-ex-1 \
	--container-command bash \
	--args '-c "git clone https://github.com/Apex-IL/architects-ex-1.git -b smoke-test && cd architects-ex-1 && python train_gpt2.py"' \
	--platform gpu-l40s-d \
	--preset 1gpu-16vcpu-96gb \
	--timeout 15m \
	--volume computefilesystem-e00hnnpfn5rr5aavma:/mnt/data

set -x

