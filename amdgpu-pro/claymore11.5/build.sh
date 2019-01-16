#!/bin/bash

docker build -t nexus.cowtownt.org:5010/claymore:amdgpu-pro-v11.5-1 . && \
  docker push nexus.cowtownt.org:5010/claymore:amdgpu-pro-v11.5-1
