#!/bin/sh -l

if [ -z "${INPUT_DINGTOKEN}" ]
then
    echo "dingToken is required!"
    exit 1
fi

if [ -z "${INPUT_MESSAGE}" ]
then
    echo "message is required!"
    exit 1
fi

url="https://oapi.dingtalk.com/robot/send?access_token=${INPUT_DINGTOKEN}"

curl "$url" \
   -H 'Content-Type: application/json' \
   -d "{\"msgtype\": \"text\", 
        \"text\": {
             \"content\": \"${INPUT_MESSAGE}\"
        }
      }"
