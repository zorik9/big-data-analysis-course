#!/bin/bash

OIFS=$IFS;
IFS=",";

dependencies=`cat dependencies.txt`
dependenciesArray=$dependencies;

for dependency in $dependenciesArray
do
	echo "check if $dependency is installed"
	pip3 list | grep -F $dependency
	if [ $? -eq 0 ]
	then
		echo "$dependency is already installed"
	else	
		echo "installing $dependency"
		pip3 install $dependency		
		if [ $? -eq 0 ]
		then
			echo "$dependency has been successfully installed"
		else
			echo "Failed to install $dependency" >&2
			exit 1
		fi
	fi
done

IFS=$OIFS;
