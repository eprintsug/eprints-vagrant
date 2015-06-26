#!/bin/bash
#

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

#
# Setup MySQL appropriately
#
function setupMySQL {
    echo "Setup MySQL? [Y/n]"
    read Y_OR_N

    if [ "$Y_OR_N" = "" ] || [ "$Y_OR_N" = "y" ] || [ "$Y_OR_N" = "Y" ]; then
        sudo systemctl start mysqld.service
        sudo mysql_secure_installation
        sudo systemctl enable mysqld.service
    else
        echo "Skipping MySQL setup."
    fi
}

function setupStep2 {
    EPRINTS_HOME=$(grep eprints /etc/passwd | cut -d : -f 6)
    # Add vagrant to the eprints user group as a convienence
    sudo cp sbin/2-final-setup.sh $EPRINTS_HOME/
    sudo chown eprints.eprints $EPRINTS_HOME/2-final-setup.sh
    echo "become the eprints user, run $EPRINTS_HOME/2-final-setup.sh"
    echo "E.g."
    echo "    sudo su eprints"
    echo "    cd"
    echo "    bash $EPRINTS_HOME/2-final-setup.sh"
    echo ""
    exit 0
}

#
# Main actions
#
assertUsername vagrant "Try: 'vagrant ssh' from your host machine."
setupMySQL
setupStep2
