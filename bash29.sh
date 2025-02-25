#!/bin/bash
######
# date: 25/02/2025
######
echo "change serena password to hunter2"
sudo passwd serena
echo -e "\nset password to venus and then lock the venus user account with usermod:"
sudo passwd venus
sudo grep venus /etc/shadow | cut -c1-70
sudo usermod -L venus
sudo grep venus /etc/shadow | cut -c1-70
# set user password and then lock the user. (when the user is locked, its start with !)
echo -e "\npasswd -d to disable serena password"
sudo grep serena /etc/shadow | cut -c1-70
sudo passwd -d serena
sudo grep serena /etc/shadow

echo -e "\nwhat is the diffrence between locking a user account password like we just did with usermod -L and passwd -d"
echo -e "\npasswd -d removes the password, allowing login via SSH keys, while usermod -L locks the account, preventing all logins"
su serena -c "echo 'This is running as Serena'; sudo passwd serena"
sudo passwd serena
echo -e "\nswitch password to serena as serena, it should fail"
su chen -c
echo -e "\nserena has to change her pass in 10 days:"
sudo chage -M 10 serena

echo -e "\nchange every new user needs to change thier password every 10 days:"
echo -e "\n run command: sudo vi /etc/login.defs to change the pass_max_days to 10"
#change the pass_max_days to 10

echo -e "\nthe answer for task 8: yes!"
echo -e "\nthe answer for task 9: vipw locks the /etc/passwd file to prevent simulateneous edits, while vi or vim doesnt provide this protection"
echo -e "\nthe answer for task11: useradd -d | -d allows you to name a home directory"
echo -e "\nthe answer for task12: how to check if user 'serena' is locked or unlocked:"
sudo grep serena /etc/shadow
sudo passwd -S serena 



