# ec2-setup
** To get you setup on EC2 with golang and docker **

# Need these before starting
* $ sudo su
* $ sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
*or*
* $ sudo yum install git-core

# Get setup
* $ mkdir sesheffield
* $ cd sesheffield
* $ git clone https://github.com/sesheffield/ec2-setup.git
* $ cd ec2-setup
* $ ./setup.sh
* $ cd
* $ source ~/.bash_profile
* $ source ~/.bashrc
* $ nvim main.go
* :PlugInstall
  - inside main.go:
  - might take awhile

should be good to go now
