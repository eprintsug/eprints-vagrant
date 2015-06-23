# eprints-vagrant

A vagrant setup for working on EPrints 3.3 on CentOS 7.

## Install

These instructions are what I followed on my Mac OS X box.

+ Install VirtualBox 
+ Install Vagrant
+ clone eprints-vagrant repo
+ change directory to eprints-vagrant
+ run "vagrant up" to create the box and provision
+ run "vagrant ssh" to finish MySQL and EPrints setup

Here is an example of running the git, vagrant and various shell commands to finish
the setup of MySQL as well as creating an initial EPrints istance.

```shell
    git clone git@github.com:rsdoiel/eprints-vagrant.git
    cd eprints-vagrants
    vagrant up && vagrant ssh
    sudo /sbin/service mysqld start
    sudo mysql_secure_installation
    exit
    sudo su eprints
    cd
    ./bin/epadmin create
    exit
    sudo /sbin/service httpd stop
    sudo /sbin/service httpd start
    w3m http://localhost
```



## EPrints notes

+ [EPrints](https://github.com/eprints/eprints)
+ [Required software](http://wiki.eprints.org/w/Required_software)
+ [EPrints on Fedora Core](http://wiki.eprints.org/w/Installing_Eprints_3_on_Fedora_Core_7)
+ [EPrints on RH Enterprise](http://wiki.eprints.org/w/Installing_EPrints_3_on_RedHat_Enterprise_4)
+ [techteam](https://techteam.wordpress.com/2008/02/08/installing-eprints-on-centos-5-using-source-files/) article mostly quoting docs.
+ [GDome install notes on RH Enterprise 4](http://wiki.eprints.org/w/Installing_EPrints_3_on_RedHat_Enterprise_4), may not really be required now
+ [Antiword](http://www.winfield.demon.nl/) is needed as an rpm for EPrints 3.3.x.
    + rpm at [pkgs.repoforge.org/antiword/antiword-0.37-3.rf.src.rpm](http://pkgs.repoforge.org/antiword/antiword-0.37-3.rf.src.rpm)
        + [Install Instructions](http://pkgs.org/centos-7/forensics-x86_64/antiword-0.37-9.el7.x86_64.rpm.html)
    + also at [rpm.pbone.net/index.php3/stat/3/srodzaj/2/search/antiword-0.37-9.el7.src.rpm](http://rpm.pbone.net/index.php3/stat/3/srodzaj/2/search/antiword-0.37-9.el7.src.rpm)
+ Digital Ocean article [Adding MySQL to CentOS 7](https://www.digitalocean.com/community/questions/can-t-install-mysql-on-centos-7)
