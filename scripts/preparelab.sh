#!/bin/bash
if [ $# -ne 2 ];
then
	echo "you need to supply two argumentd (previous lab next lab)"
	echo "Example: scripts/preparelab lab1 lab2"
	exit 1
fi
cd /home/user/ansible-lab
cp -r $1 $2
sed -i -e "s/$1/$2/g" $2/ansible.cfg

if [ x$2 = "xlab02" ] ;
then
   echo "initialising inventory"
   myuser=$(cat /etc/myhostname|awk -F. '{print $1}' | awk -F- '{print $2}')
   sed -e s/%%USER%%/${myuser}/g scripts/inventory.yml >${2}/inventory/inventory.yml
fi
