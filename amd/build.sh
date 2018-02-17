#!/bin/bash

docker build -t wesparish/claymore:amd-v11.0-1 . && \
  docker push wesparish/claymore:amd-v11.0-1
