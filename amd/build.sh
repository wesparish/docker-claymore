#!/bin/bash

docker build -t wesparish/claymore:amd-v11.5-1 . && \
  docker push wesparish/claymore:amd-v11.5-1
