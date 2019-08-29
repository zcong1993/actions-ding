#!/bin/sh -l

if [ -z "${INPUT_DINGTOKEN}" ]
then
    echo "dingToken is required!"
    exit 1
fi

if [ -z "${INPUT_BODY}" ]
then
    echo "body is required!"
    exit 1
fi

echo "body: $INPUT_BODY"

url="https://oapi.dingtalk.com/robot/send?access_token=${INPUT_DINGTOKEN}"

curl "$url" \
   -H 'Content-Type: application/json' \
   -d "${INPUT_BODY}"
