#!/bin/bash

###
### Copyright 2014, Boundary
###
### Licensed under the Apache License, Version 2.0 (the "License");
### you may not use this file except in compliance with the License.
### You may obtain a copy of the License at
###
###     http://www.apache.org/licenses/LICENSE-2.0
###
### Unless required by applicable law or agreed to in writing, software
### distributed under the License is distributed on an "AS IS" BASIS,
### WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
### See the License for the specific language governing permissions and
### limitations under the License.
###

if [ $# -ne 3 ]
then
   echo "usage: $(basename $0) source metric measure"
   exit 1
else
   typeset -r name=$1
   typeset -r metric=$2
   typeset -r measure=$3
fi

# Fetch our id based on the name provided
source=$($BOUNDARY_API_SHELL_HOME/src/main/scripts/meter/list.sh | jq ".[] | select(.name == \"$name\") | .obs_domain_id" | tr -d '"')
if [ -z $source ]
then
   echo "Unable to find source: $name"
   exit 1
fi

DATA="{\"source\": \"$source\", \"metric\": \"$metric\", \"measure\": $measure}"

echo curl -s -X POST -u "$BOUNDARY_METRICS_EMAIL:$BOUNDARY_METRICS_TOKEN" -H "Content-Type: application/json" -d "$DATA" "https://$BOUNDARY_METRICS_API_HOST/v1/measurements" 
curl -s -X POST -u "$BOUNDARY_METRICS_EMAIL:$BOUNDARY_METRICS_TOKEN" -H "Content-Type: application/json" -d "$DATA" "https://$BOUNDARY_METRICS_API_HOST/v1/measurements" 