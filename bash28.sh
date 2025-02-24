#!/bin/bash
############
# date : 24/02/2025
############
echo "create a user named 'serena'"
sudo useradd -m -c 'Serena Williams' serena 
# create user name
sudo passwd serena
# enter password for the new user
echo -e "\ncreate new user with home directory, bash shell, a description that reads Venus Williams in one line!:"
sudo useradd -m -c  "Venus Williams" -s /bin/bash venus
echo -e "\nchoose a password for 'venus':"
sudo passwd venus

echo -e  "\n /etc/passwd, /etc/shadow and /etc/group output:"
sudo tail -2 /etc/passwd
sudo tail -2 /etc/shadow
sudo tail -2 /etc/group
echo -e "\ncheck if there is home directory:"
ls -lrt /home | tail -2

echo -e "\ncreate user named 'einstime' with a default logon shell named /bin/date"
sudo useradd -s /bin/date einstime
echo -e "\nchoose a password for einstime:"
sudo passwd einstime
echo -e "\ntrying to run 'su - einstime', the output will be the date"
su - einstime
echo -e "\ncreating txt file named welcome.txt and every new user will see this file in their home directory"
echo Hello | sudo tee /etc/skel/welcome.txt

echo -e "\ncreate and delete test user, checking if the welcome.txt is working"
sudo useradd -m test
sudo ls -l /home/test
sudo userdel -r test

echo -e "\nchanging 'serena' default shell to 'bin/bash'"
sudo grep serena /etc/passwd
sudo usermod -s /bin/bash serena
sudo grep serena /etc/passwd
