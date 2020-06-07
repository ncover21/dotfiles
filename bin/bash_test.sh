#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET_COLOR='\033[0m'

set -e

main() {
    read -p "Bash Test. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "YES"
    else
        echo "NO"
    fi;
}

if [ ! $DEBUG ]; then
   main
fi
