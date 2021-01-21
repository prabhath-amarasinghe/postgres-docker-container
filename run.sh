#!/bin/bash

version=$(<version.txt)
password=$(<password.txt)
volume=$(<volume.txt)
target=$(<target.txt)


if [[ -z $(docker images -q postgres:$version) ]]; then
   echo "No postgres:$version image found. Pulling from docker hub"
   docker pull postgres:$version
   
else
    echo "Found already existing image postgres:$version"
   
fi
docker run --rm -e POSTGRES_PASSWORD=$password -d -p 5432:5432 -v $volume:$target postgres:$version
