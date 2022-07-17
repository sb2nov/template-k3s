#!/bin/bash

function waitssh() {
  while ! nc -z 127.0.0.1 2222; do   
    sleep 0.1
  done
  ./ssh.sh "whoami" &>/dev/null
  if [ $? -ne 0 ]; then
    sleep 1
    waitssh
  fi
}

waitssh