#!/bin/bash

docker build -t wesparish/claymore:amd-v10.0 . && \
  docker push wesparish/claymore:amd-v10.0
