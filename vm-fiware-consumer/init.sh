#!/bin/bash

#!/bin/bash

printf "\n" >> /home/vagrant/.bashrc
echo 'export PS1="\[\e[01;34m\]consumer\[\e[0m\]\[\e[01;37m\]:\w\[\e[0m\]\[\e[00;37m\]\n\\$ \[\e[0m\]"' >> /home/vagrant/.bashrc
printf "\n" >> /home/vagrant/.bashrc

sudo yum clean all
sudo yum -y update

#Downloading configuration files for java, maven, and mongodb

curl https://gist.githubusercontent.com/danimaniarqsoft/177b6c8cb579f0cac87b8d13d74e886c/raw/619c9e672496cddab49e92f44765a295b488ffb0/mongodb-org.repo > mongodb-org.repo
curl https://gist.githubusercontent.com/danimaniarqsoft/177b6c8cb579f0cac87b8d13d74e886c/raw/619c9e672496cddab49e92f44765a295b488ffb0/maven.sh > maven.sh
curl https://gist.githubusercontent.com/danimaniarqsoft/177b6c8cb579f0cac87b8d13d74e886c/raw/619c9e672496cddab49e92f44765a295b488ffb0/java.sh > java.sh


sudo mv mongodb-org.repo /etc/yum.repos.d/
sudo mv maven.sh /etc/profile.d/
sudo mv java.sh /etc/profile.d/

yum repolist

#  install the consumer server
## Install Java 8
curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm -O
sudo yum -y localinstall jdk-8u111-linux-x64.rpm

### Crear liga java.csh
sudo ln -s /etc/profile.d/java.sh /etc/profile.d/java.csh

## Install Maven
curl http://www-us.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz > apache-maven-3.3.9-bin.tar.gz
sudo mv apache-maven-3.3.9-bin.tar.gz /opt
sudo tar xzf /opt/apache-maven-3.3.9-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.3.9 /opt/maven

source /etc/profile.d/maven.sh
source /etc/profile.d/java.sh
source /etc/profile.d/java.csh

## Install Git
sudo yum -y install git
git clone https://github.com/carlosurteaga/fiware-orion-subscriber.git
sudo chown -R vagrant:vagrant fiware-orion-subscriber
## Install Mongodb
sudo yum -y install mongodb-org
sudo systemctl start mongod

#sudo yum -y install wget
sudo yum -y install wget
cd /opt/
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz"
sudo tar xzf jdk-8u144-linux-x64.tar.gz
cd /opt/jdk1.8.0_144/
sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_144/bin/java 2
#sudo alternatives --config java
sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_144/bin/jar 2
sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_144/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_144/bin/jar
alternatives --set javac /opt/jdk1.8.0_144/bin/javac

#export JAVA_HOME=/opt/jdk1.8.0_144
#export JRE_HOME=/opt/jdk1.8.0_144/jre
#export PATH=/opt/jdk1.8.0_144/bin:/opt/jdk1.8.0_144/jre/bin:$PATH

## Ejecutar al ingresar a la maquina virtual

# mvn -f fiware-orion-subscriber/pom.xml spring-boot:run
