#!/bin/sh

sd_info() {
  local disk=$1
  local dir="/sys/block/$disk/device/"

  cd $dir

  for file in `ls *`; do
    if [ -f $file ]; then
      echo $dir$file
      cat $file
      echo
    fi
  done
}

sd_info "$@"