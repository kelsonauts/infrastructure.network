#!/bin/bash -xe

STACK_NAME="network"

if [[ $(aws cloudformation describe-stacks --query 'Stacks[].StackName' --output text) == "${STACK_NAME}" ]]; then
	aws cloudformation update-stack --stack-name "${STACK_NAME}" --template-body file://network.yaml --parameters file://parameters.json
else
	aws cloudformation create-stack --stack-name "${STACK_NAME}" --template-body file://network.yaml --parameters file://parameters.json
fi
