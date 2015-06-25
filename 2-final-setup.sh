#!/bin/bash

function assertUsername {
    USERNAME=$1
    ERROR_MSG=$2
    WHOAMI=$(whoami)

    if [ "$USERNAME" = "" ];then
        echo "SCRIPTING error, assertUsername expects a username to be supplied to check."
        exit 1
    fi

    if [ "$WHOAMI" != "$USERNAME" ]; then
        echo "This script should be run as the $USERNAME user."
        if [ "$ERROR_MSG" != "" ]; then
            echo $ERROR_MSG;
        fi
        exit 1
    fi
}

function setupEPrintsRepository {
    # Move to the eprints installation location
    cd
    echo "EPrints installed in directory: "$(pwd)
    # create your first repository
    ./bin/epadmin create
    echo "Hopefully you have created your first repository succeessfully, exiting eprints user"
}

function setupStep3 {
    echo "Exit session and return to the vagrant user."
    exit 0
}


#
# Main
#
assertUsername eprints "Try: sudo su eprints"
setupEPrintsRepository
setupStep3
