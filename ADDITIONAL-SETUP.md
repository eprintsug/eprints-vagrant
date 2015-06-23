
This vagrant instance will need additional setup to be useful for EPrints development and testing.  The following
requires interactive configuration.

1. MySQL (need to start MySQL and run the mysql_secure_installation script the first time the VM is created)
2. EPrints needs to have a respository created via the "bin/epadmin create" command.
3. Apache needs to be started/restart

On your vagrant host machine you'll need to add the assigned IP number to the name you created for your 
EPrints repository when you ran *epadmin*. You can find the ip address assigned to the VM doing the following

```shell
	vagrant ssh
	ifconfig
```

On my Mac I would then update /etc/hosts before pointing my browser at the hostname I configured with *epadmin*.

