#!/bin/bash

docker build -t wesparish/claymore:cuda-v11.5-1.0 . && \
  docker push wesparish/claymore:cuda-v11.5-1.0 
