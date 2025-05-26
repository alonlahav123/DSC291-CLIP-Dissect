#!/usr/bin/env bash
set -e

# Download broden1_224 if missing
if [ ! -f data/broden1_224/index.csv ]; then
  echo "Downloading broden1_224"
  mkdir -p data
  pushd data

  # follow redirects, show progress, save to broden1_224.zip
  curl --progress-bar -L \
       http://netdissect.csail.mit.edu/data/broden1_224.zip \
       -o broden1_224.zip

  unzip -q broden1_224.zip
  rm broden1_224.zip

  # strip out unneeded files
  pushd broden1_224
    rm *.txt
    rm images/ade20k/*object.png images/ade20k/*color.png images/ade20k/*.png
    rm images/dtd/*.png
    rm images/opensurfaces/*color.png images/opensurfaces/*.png
    rm images/pascal/*.png
  popd

  popd
fi
