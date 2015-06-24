# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "chef/centos-7.0"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  #config.vm.network "forwarded_port", host:8080, guest: 80
  #config.vm.network "forwarded_port", host:8443, guest: 443


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/home/vagrant/share"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  config.vm.provider "virtualbox" do |vb|
   # Display the VirtualBox GUI when booting the machine
   vb.gui = false
   # Customize the amount of memory on the VM:
   vb.memory = "2048"
   vb.cpus = 4
   # Example custom settings: v.customize ["modifyvm", :id, "--vram", "<vramsize in MB>"]
   # v.customize ["modifyvm", :id, "--vram", "128"]
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  config.vm.provision "shell", inline: <<-SHELL
    # Setup the base system with development tools
    sudo yum -y install epel-release
    sudo yum -y install deltarpm
    sudo yum -y install perl
    sudo yum -y install wget
    sudo yum -y install w3m
    sudo yum -y install lynx
    sudo yum -y group update
    sudo yum -y groups mark convert
    sudo yum -y groupinstall "Development Tools"
    sudo yum -y install antiword
    sudo yum -y install poppler poppler-utils
    sudo yum -y install tetex-latex
    sudo yum -y install ImageMagick
    sudo yum -y install glib-devel
    sudo yum -y install "glib2-devel.*"
    sudo yum -y install libxml2
    sudo yum -y install libxslt
    sudo yum -y install libxml2-devel
    sudo yum -y install libxslt-devel
    sudo yum -y install gdome2
    sudo yum -y install gdome2-devel
    # Setup and install MySQL server from Oracle.
    sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
    sudo yum -y install mysql-server
    # Setup and install Apache2
    sudo yum -y install httpd
    # Setup and install Perl as needed by EPrints
    sudo yum -y install perl-YAML
    sudo yum -y install perl-CPAN
    sudo yum -y install mod_perl
    sudo yum -y install perl-CGI
    sudo yum -y install perl-libxml-perl
    sudo yum -y install perl-DBI
    sudo yum -y install perl-DBD-MySQL
    sudo yum -y install perl-XML-NamespaceSupport
    sudo yum -y install perl-XML-SAX
    sudo yum -y install perl-XML-SAX-Base
    sudo yum -y install perl-XML-SAX-Writer
    sudo yum -y install perl-XML-Simple
    sudo yum -y install perl-XML-DOM
    sudo yum -y install perl-XML-LibXML
    sudo yum -y install perl-XML-LibXSLT
    sudo yum -y install perl-MIME-Types
    sudo yum -y install perl-MIME-Lite
    sudo yum -y install perl-Unicode-String
    sudo yum -y install perl-TermReadKey
    sudo yum -y install perl-Readonly
    # install Antiword from an rpm required EPrints 3.3
    wget https://forensics.cert.org/cert-forensics-tools-release-el7.rpm
    sudo rpm -Uvh cert-forensics-tools-release*rpm
    sudo yum --enablerepo=forensics install antiword
    # now instal EPrints3
    sudo rpm -ivh http://rpm.eprints.org/rpm-eprints-org-key-1-1.noarch.rpm
    sudo rpm -ivh http://rpm.eprints.org/eprints/noarch/rpm-eprints-org-1-1.noarch.rpm
    sudo yum -y upgrade libxml2 libxslt perl-XML-LibXML perl-XML-LibXSLT
    sudo yum -y install eprints
    echo "Start mysql: sudo /sbin/service mysqld start"
    echo "Secure MySQL: sudo mysql_secure_installation"
    echo "You should now be ready to run epadmin to create repositories"
    echo "E.g. sudo su eprints"
    echo "After creating your repostiory you many need to run chcon for SELinux"
    echo "to allow Apache access to the appropraite directories. E.g. "
    echo "\tsudo chmod -R 770 /usr/share/eprints/var/"
    echo "\tsudo chmod -R 770 /usr/share/eprints/lib/"
    echo "\tsudo chmod -R 770 /usr/share/eprints/archives/[REPO_NAME_GOES_HERE]/documents/"
    echo "\tsudo chcon -R -h -t httpd_sys_script_rw_t /usr/share/eprints/archives/[REPO_NAME_GOES_HERE]/documents/"
    echo "\tsudo chcon -R -h -t httpd_sys_script_rw_t /usr/share/eprints/var/"
    echo "\tsudo chcon -R -h -t httpd_sys_script_rw_t /usr/share/eprints/lib/"
    echo "See http://wiki.eprints.org/w/Installing_EPrints_3_via_Redhat_RPM for more info."
    echo "Network was configured as private with an ip of 192.168.33.100"
    echo ""
  SHELL
end
