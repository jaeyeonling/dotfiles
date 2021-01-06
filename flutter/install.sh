#! /bin/bash

export FLUTTER=${HOME}/.flutter

if [ ! -d $FLUTTER ]; then
  echo "  > Download flutter"
  git clone https://github.com/flutter/flutter.git $FLUTTER

  export PATH=$FLUTTER/bin:$PATH

  flutter doctor
  flutter --version
fi
