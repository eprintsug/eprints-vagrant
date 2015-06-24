# eprints-vagrant

A vagrant setup for working with EPrints 3.3 on CentOS 7.

## Install

These instructions are what I followed on my Mac OS X box.

+ Install VirtualBox
+ Install Vagrant
+ clone eprints-vagrant repo
+ change directory to eprints-vagrant
+ run "vagrant up" to create the box and provision
+ run "vagrant ssh" to finish MySQL and EPrints setup

Here is an example of running the git, vagrant and various shell commands to finish
the setup of MySQL as well as creating an initial EPrints instance.

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
    sudo /sbin/service httpd restart
```

Additional Apache setup may be needed depending on your configuration choices.
I needed to update my /etc/hosts file on my host machine so I could access the created
virtual host from the web browser on my host machine. To set this correctly I needed
to know the IP address assigned by DHCP on the guest machine. You can find how that by
doing the following

```shell
    vagrant ssh
    ifconfig
```

Reading through the out put of *ifconfig* shows the IP address assigned (mine was the second
one listed). If the IP assigned was 172.28.128.3 then I would add and entry to my host file
similar too

```shell
    172.28.128.3 mydemo.eprints-dev.local
```

This way pointing my web browser on my host machine at http://mydemo.eprints-dev.local pulls up my newly
defined repository.  The EPrints wiki video, [Training Video: EPrints Install](http://wiki.eprints.org/w/Training_Video:EPrints_Install), 
shows this at about four minutes in.


See [ADDITIONAL-SETUP.md](docs/ADDITIONAL-SETUP.md) for more notes.


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
+ Digital Ocean article [Adding MySQL to CentOS 7](https://www.digitalocean.com/community/questions/can-t-install-mysql-on-centos-7)
