#!/bin/bash

docker build -t wesparish/claymore:cuda-v14.7-1.0 . && \
  docker push wesparish/claymore:cuda-v14.7-1.0 
