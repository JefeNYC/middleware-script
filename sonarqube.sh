#!/bin/bash

##AUTHOR: Jeff
##DATE: 10/25/2022
## Description: To install Sonarqube automatically on CentOS Server


## PLEASE RUN THIS AS USER VAGRANT (NOT ROOT USER)


user_name=`whoami`

if [ $user_name != vagrant ]

then

echo "Must be run as user vagrant!!!!"
exit1
fi


echo "Sonarqube will install shortly"

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y


cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip


sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64 
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

 ./sonar.sh start

echo "Installation done successfully"
echo "Please get the IP address and access your sonarqube on the browser"