#!/bin/bash

export USER_NAME=username
export USER_PASSWORD=password

if [ -d ../scripts ]; then
    cd ../scripts
    chmod +x ./install.sh
    ./install.sh
fi
