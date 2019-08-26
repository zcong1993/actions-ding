#!/bin/sh -l

url="https://oapi.dingtalk.com/robot/send?access_token=${INPUT_DINGTOKEN}"

curl "$url" \
   -H 'Content-Type: application/json' \
   -d "{\"msgtype\": \"text\", 
        \"text\": {
             \"content\": \"${INPUT_MESSAGE}\"
        }
      }"
