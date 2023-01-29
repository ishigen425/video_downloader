#!/bin/sh

FILE_NAME=$1
URL=$2
echo "file name:$FILE_NAME"
echo "url:$URL"

while read LINE
do
    if [ ${LINE:0:1} != "#" ]
    then
        wget ${URL}${LINE}
    fi
done < ${FILE_NAME}

ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i ${FILE_NAME} -c copy output.mp4
rm *.ts
