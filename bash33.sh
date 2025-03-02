#!/bin/bash
sudo groupadd sports1
sudo mkdir /home/sports1
sudo chown root:sports1 /home/sports1

echo -e "\nMembers of the sports group should be able to create files in the dir:"
sudo chmod 770 /home/sports1
echo -e "\nAll files created in the dir should be group-owned by the sports1 group:"
sudo chmod 2770 /home/sports1

sudo chmod +t /home/sports1

echo -e "\nSet up /home/sports with proper group ownership and permissions"
ls -l /usr/bin/passwd

#Remove setuid permissions
sudo chmod 755 /usr/bin/passwd
echo -e "\nRemove setuid from /usr/bin/passwd"

#Try changing password as normal user (expected failure)
echo -e "\nAttempting to change password as normal user (should fail)"
passwd || echo -e "\nPassword change failed as excpected\n"

#Reset setuid permissions
sudo chmod 4775 /usr/bin/passwd
ls -l /usr/bin/passwd
echo -e "Restored setuid on /usr/bin/passwd"

#Work with file att
mkdir -p ~/attr
cd ~/attr
#Create a file and list att
touch file42
lsattr
echo -e "\n Set immutable attribute on file42"

#Attempt to remove the file (should fail)
sudo rm -rf file42 2>/dev/null || echo -e "\nUnable to remove file42 due to immutable attributte"

#Remove immutable attribute and delete file
sudo chattr -i filer42
rm -rf file42
echo -e "\nRemove immutable attribute and deleted 42"
echo -e "\n\n\t\tScript execution completed!"

