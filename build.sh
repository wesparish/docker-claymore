#!/bin/bash

registry=${1:-wesparish}
imagename=$(basename $PWD)
imagename=${2:-$imagename}

for dockerfile in $(find  -name Dockerfile); do
  versionvariant=$(dirname $dockerfile | sed -e 's|^./||g' -e 's|/|-|g')
  echo Building variant: $versionvariant
  echo docker build -t $registry/${imagename}:${versionvariant} $(dirname $dockerfile)
  docker build -t $registry/$versionvariant $(dirname $dockerfile)
  echo docker push $registry/${imagename}:${versionvariant}
  docker push $registry/$versionvariant
  echo docker tag $registry/${imagename}:${versionvariant} nexus.cowtownt.org:5010/${imagename}:${versionvariant}
  docker tag $registry/$versionvariant nexus.cowtownt.org:5010/$versionvariant
  echo docker push nexus.cowtownt.org:5010/${imagename}:${versionvariant}
  docker push nexus.cowtownt.org:5010/$versionvariant
done
