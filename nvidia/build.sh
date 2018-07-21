#!/bin/bash

docker build -t wesparish/claymore:nvidia-v11.5-1.3 . && \
  docker push wesparish/claymore:nvidia-v11.5-1.3 
