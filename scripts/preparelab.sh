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
