#!/bin/bash

docker build -t wesparish/claymore:nvidia-v10.0 . && \
  docker push wesparish/claymore:nvidia-v10.0 
