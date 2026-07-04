#!/bin/bash

PROFILE=dolevelb

set +x

nebius profile create \
	--endpoint api.nebius.cloud \
	--service-account-id serviceaccount-e00j9yyxp97astchac \
	--public-key-id publickey-e00cacpw3qngckqsqm \
	--private-key-file nebius-apex-private.pem \
	--profile ${PROFILE}\
	--parent-id project-e00qcp0kpr00gb7cnvmav8

set -x

