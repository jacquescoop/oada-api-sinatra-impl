#!/bin/bash

url=http://localhost:4567
opts="-v"

i=0
#cmdList[((i++))]="curl -X GET ${opts} ${url}/files"
#cmdList[((i++))]="curl -X GET ${opts} -d file_format=csv ${url}/files/yield/yield-data.csv?file_format=csv"
cmdList[((i++))]="curl -X PUT ${opts} -d file_format=csv -silent --location --upload-file yield-data-upload.csv ${url}/files/yield/yield-data.csv?file_format=csv"
#cmdList[((i++))]="curl -X DELETE ${opts} ${url}/files/yield/yield-data.csv?file_format=csv"
#cmdList[((i++))]="curl -X GET ${opts} ${url}/metadata"
#cmdList[((i++))]="curl -X PUT ${opts} ${url}/metadata"
#cmdList[((i++))]="curl -X GET ${opts} ${url}/search"
#cmdList[((i++))]="curl -X GET ${opts} -d file_format=shp ${url}/features/file_formats"
#cmdList[((i++))]="curl -X GET ${opts} ${url}/features/file_formats/list"
#cmdList[((i++))]="curl -X GET ${opts} -d from_file_format=csv -d to_file_format=tsv ${url}/features/transforms"
#cmdList[((i++))]="curl -X GET ${opts} ${url}/features/transforms/list"

for cmd  in "${cmdList[@]}" ; do
  echo "${cmd}"
  ${cmd}
  echo ""
  echo ""
done
