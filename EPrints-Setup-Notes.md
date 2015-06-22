
# Random notes

## Manual installation steps


```shell
    cpan # Answer: yes, sudo, yes
    echo "install Data::ShowTable" | perl -MCPAN -e shell
    echo "install MIME::Base64" | perl -MCPAN -e shell
    echo "install Mail::Address" | perl -MCPAN -e shell
```

## GDome may not be required

GDome fails to build with CentOS 7 but the documentation indicates this may not be [required (See top of page)](http://wiki.eprints.org/w/Required_software). If GDome is needed then the Wiki has a page [Installing GDOME on Redhat 7](http://wiki.eprints.org/w/Installing_GDOME_on_Redhat_7) maybe helpful.

## Next Steps

The EPrints installation itself should be automated if possible.

These are some possible steps after Perl if fully configured (e.g. if GDOME is needed, it needs to have been installed successfully)

```shell
    cd /usr/local/build
    wget http://files.eprints.org/130/01/eprints-3.0-rc-1.tar.gz
    tar xzvf eprints-3.0-rc-1.tar.gz
    cd eprints-3.0-rc-1
    ./configure –prefix=/authtest/lib/eprints3 –with-user=apache –with-group=apache
    ./install.pl
    echo "# EPrints Setup" >> /etc/httpd/conf/httpd.conf
    cat Include /var/lib/eprints3/cfg/apache.conf >> /etc/httpd/conf/httpd.conf
    cd /etc/selinux
    sed -i.original -e "s/"$(grep -E "^SELINUX=" config)"/SELINUX=disabled/g" config
    /sbin/chkconfig mysqld on
    /sbin/chkconfig httpd on
    ln -s /var/lib/eprints3/bin/epindexer /etc/init.d/epindexer
    /sbin/chkconfig -add epindexer
    /sbin/chkconfig epindexer on
```

