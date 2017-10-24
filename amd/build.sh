#!/bin/bash

docker build -t wesparish/claymore:amd . && \
  docker push wesparish/claymore:amd 
