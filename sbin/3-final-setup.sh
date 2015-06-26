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
    EPRINTS_HOME=$(grep eprints /etc/passwd | cut -d : -f 6)
    # fix perms
    sudo chmod -R 770 $EPRINTS_HOME/var/
	sudo chcon -R -h -t httpd_sys_script_rw_t $EPRINTS_HOME/var/
    sudo chmod -R 770 $EPRINTS_HOME/lib/
    sudo chcon -R -h -t httpd_sys_script_rw_t $EPRINTS_HOME/lib/
    cd $EPRINTS_HOME
    find archives/ -maxdepth 1 -type d | while read ITEM; do
        if [ "$ITEM" != "archives/" ]; then
            echo "Updating settings for "$ITEM"/documents"
            sudo chmod -R 770 "$ITEM"/documents
            sudo chcon -R -h -t httpd_sys_script_rw_t "$ITEM"/documents
        fi
    done
}

function reportIPForHostSetup {
    echo "Find your IP address visible to your vagrant host."
    ifconfig
    echo "Don't forget to add your eprints repository virtual host info"
    echo "to /etc/hosts on your vagrant host machine."
    echo ""
    echo "See http://wiki.eprints.org/w/Training_Video:EPrints_Install"
    echo "at about 4 minutes 20 seconds of the installation tutorial."
    exit 0
}


# restart apache
sudo systemctl enable httpd.service
sudo systemctl httpd.service restart

#
# Main
#
assertUsername vagrant
fixPermissions
reportIPForHostSetup
