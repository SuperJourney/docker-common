#/bin/env bash 

set -e 

cd /workspace

if [ ! -d "./node-project" ];then 
    git clone git@github.com:canbefree/node-project.git
fi