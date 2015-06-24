# eprints-vagrant

A vagrant setup for working with EPrints 3.3 on CentOS 7.

## Install

Steps I followed on my Mac OS X box to get EPrints 3.3. up.

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Clone rsdoiel/eprints-vagrant Github repository
4. Change directory to eprints-vagrant
5. Run "vagrant up" to create the box and provision
6. Run "vagrant ssh" to finish MySQL and EPrints setup
7. Start MySQL on the guest machine
8. Run the interactive *mysql_secure_installation* script to secure MySQL
9. Run *mysql_secure_installation* to secure MySQL on the guest machine
10. Become the *eprints* user
11. Create an EPrints repository
12. Stop being the *eprints* user
13. Restart Apache on the guest machine

Steps 1 and 2 are your typical Mac app install (e.g. go to the website, download
the dmg/pkg and install those apps).

Here are the shell commands for steps 3 through 6.

```shell
    git clone https://github.com/rsdoiel/eprints-vagrant.git
    cd eprints-vagrant
    vagrant up
    vagrant ssh
```

At this stage you could follow along in Adam Field's training video
[Training Video: EPrints Install](http://wiki.eprints.org/w/Training_Video:EPrints_Install).

You could also run the following commands as I did on my Mac from my guest machine
(i.e. your ssh session from step 6)

```shell
    sudo /sbin/service mysqld start
    sudo mysql_secure_installation
    sudo su eprints
    cd
    ./bin/epadmin create
    exit
    sudo /sbin/service httpd restart
```

At this point you have an empty EPrints repository running on the guest machine.
You can access this from your host machine web browser with a little more work.
You need to add an entry to your */etc/hosts* file so that your guest machines
virtual hostname will be accessible from your host machines web browser. Before
you can do that you need to know the IP address assigned by DHCP to your guest
machine. This can be done by ssh-ing into your guest machine and running ifconfig.

```shell
    vagrant ssh
    ifconfig
```

Read the output of *ifconfig* and find the assigned IP address. On my guest
machine it was assigned 172.28.128.3, yours will be different. It was the second
entry reported by *ifconfig*.  I had named my new repository "mydemo"
on host "eprints-dev.local" so I added the following entry to */etc/hosts*.

```shell
    172.28.128.3 mydemo.eprints-dev.local
```

Adam Field walks you your my steps 7 through 13 in the EPrints wiki video
[Training Video: EPrints Install](http://wiki.eprints.org/w/Training_Video:EPrints_Install).
The */etc/hosts* is discussed at about four minutes and nineteen seconds.

[Additional setup and troubleshooting info](docs/ADDITIONAL-SETUP.md) in docs folder.


## General EPrints pages

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
