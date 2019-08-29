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

HTTP_RESPONSE=$(curl -s --write-out "HTTPSTATUS:%{http_code}" "$url" \
   -H 'Content-Type: application/json' \
   -d "${INPUT_BODY}")

# extract the body
HTTP_BODY=$(echo "$HTTP_RESPONSE" | sed -e 's/HTTPSTATUS\:.*//g')

if [ ! "$HTTP_BODY" = '{"errcode":0,"errmsg":"ok"}'  ]; then
  echo "Error Response: ${HTTP_RESPONSE}"
  exit 1
fi
