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

function fixPermissions {
    ERINTS_HOME=$(grep eprints /etc/passwd | cut -d : -f 6)
    # fix perms
    sudo chmod -R 770 $EPRINTS_HOME/var/
	sudo chcon -R -h -t httpd_sys_script_rw_t $EPRINTS_HOME/var/
    sudo chmod -R 770 $EPRINTS_HOME/lib/
    sudo chcon -R -h -t httpd_sys_script_rw_t $EPRINTS_HOME/lib/
    find $EPRINTS_HOME -maxdepth 1 -type d | while read ITEM; do
        sudo chmod -R 770 $ITEM
        sudo chcon -R -h -t httpd_sys_script_rw_t $ITEM/documents
    done
}

function reportIPForHostSetup {
    echo "Find your IP address visible to your vagrant host."
    ifconfig
    echo "Add your eprints repository virtual host infor to /etc/hosts on"
    echo "your host machine."
    echo "See http://wiki.eprints.org/w/Training_Video:EPrints_Install for an installation tutorial"
    exit 0
}


# restart apache
sudo /sbin/service httpd restart

#
# Main
#
assertUsername vagrant
fixPermissions
reportIPForHostSetup
