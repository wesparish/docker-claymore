#!/bin/bash

docker build -t wesparish/claymore:amdgpu-pro-v14.7-1 . && \
  docker push wesparish/claymore:amdgpu-pro-v14.7-1
