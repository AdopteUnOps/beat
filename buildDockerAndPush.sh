#!/bin/bash
###############################################################################################
# ./build.sh : Build all project
# ./build.sh project_example : Build project_example
###############################################################################################
# fail fast
set -e
image_version=1.0.0-SNAPSHOT

function buildAndPush() {
    echo build adopteunops/$1:${image_version}
    time docker build -t adopteunops/$1:${image_version} $1
    echo push adopteunops/$1:${image_version}
    docker push adopteunops/$1:${image_version}
    echo adopteunops/$1:${image_version} is pushed
}

function buildAll() {
  for folder in packetbeat-config packetbeat-dashboard metricbeat-config metricbeat-dashboard; do
      buildAndPush $folder
  done
  echo build all finish !
}

if [ $1 ]; then
   buildAndPush $1
else
   buildAll
fi
