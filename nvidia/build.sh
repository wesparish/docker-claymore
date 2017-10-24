#!/bin/bash

docker build -t wesparish/claymore:nvidia . && \
  docker push wesparish/claymore:nvidia 
