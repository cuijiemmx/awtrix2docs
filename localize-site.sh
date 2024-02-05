#! /usr/bin/env bash

rm -rf npm

mkdir npm

cd npm

grep -oE 'https://(cdn|unpkg|browser)[^"]*' ../index.html | http_proxy=http://127.0.0.1:1080 https_proxy=http://127.0.0.1:1080 xargs -I% wget %

cd ..

sed -i ''  -E 's/https:\/\/.*\/([^\/]+")/\/npm\/\1/g' index.html