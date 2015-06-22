#
# From here may require hand installation until an Image of this is saved.
#    sudo perl -MCPAN -e shell <<EOT
#    yes
#    sudo
#    yes
#    install Data::ShowTable
#    install MIME::Base64
#    install Mail::Address
#    install MIME::Types
#    install MIME::Lite
#    install Unicode::String
#    install Term::ReadKey
#    install Readonly
#    install XML::LibXML
#    install CGI
#    exit
#EOT
#
# FIXME: gdome2 fails to compile/install do to dependencies
# instructions can be found at: http://wiki.eprints.org/w/Installing_GDOME_on_Fedora_Core_3
#
# [vagrant@localhost ~]$ sudo rpm -Uvh gdome2-0.8.1-1.i386.rpm gdome2-devel-0.8.1-1.i386.rpm
# error: Failed dependencies:
#   ld-linux.so.2 is needed by gdome2-0.8.1-1.i386
#   libc.so.6 is needed by gdome2-0.8.1-1.i386
#   libglib-2.0.so.0 is needed by gdome2-0.8.1-1.i386
#   libm.so.6 is needed by gdome2-0.8.1-1.i386
#   libpthread.so.0 is needed by gdome2-0.8.1-1.i386
#   libxml2.so.2 is needed by gdome2-0.8.1-1.i386
#   libz.so.1 is needed by gdome2-0.8.1-1.i386
#   libc.so.6(GLIBC_2.0) is needed by gdome2-0.8.1-1.i386
#   libc.so.6(GLIBC_2.1.3) is needed by gdome2-0.8.1-1.i386
#   glib2-devel >= 2.2.0 is needed by gdome2-devel-0.8.1-1.i386
#   libxml2-devel >= 2.4.26 is needed by gdome2-devel-0.8.1-1.i386
#
#    wget http://gdome2.cs.unibo.it/rpm/gdome2-0.8.1-1.i386.rpm
#    wget http://gdome2.cs.unibo.it/rpm/gdome2-devel-0.8.1-1.i386.rpm
#    rpm -Uvh gdome2-0.8.1-1.i386.rpm gdome2-devel-0.8.1-1.i386.rpm
#    mkdir -p /usr/local/build
#    cd /usr/local/build
#    wget http://cpan.uwinnipeg.ca/cpan/authors/id/T/TJ/TJMATHER/XML-GDOME-0.86.tar.gz
#    tar xzvf XML-GDOME-0.86.tar.gz
#    cd XML-GDOME-0.86
#    perl Makefile.PL
#    make
#    make install
#    cd /usr/local/build
#    wget http://files.eprints.org/130/01/eprints-3.0-rc-1.tar.gz
#    tar xzvf eprints-3.0-rc-1.tar.gz
#    cd eprints-3.0-rc-1
#    ./configure –prefix=/authtest/lib/eprints3 –with-user=apache –with-group=apache
#    ./install.pl
#    echo "# EPrints Setup" >> /etc/httpd/conf/httpd.conf
#    cat Include /var/lib/eprints3/cfg/apache.conf >> /etc/httpd/conf/httpd.conf
#    cd /etc/selinux
#    sed -i.original -e "s/"$(grep -E "^SELINUX=" config)"/SELINUX=disabled/g" config
#    /sbin/chkconfig mysqld on
#    /sbin/chkconfig httpd on
#    ln -s /var/lib/eprints3/bin/epindexer /etc/init.d/epindexer
#    /sbin/chkconfig -add epindexer
#    /sbin/chkconfig epindexer on

