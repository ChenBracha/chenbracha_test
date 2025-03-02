#!/bin/bash
###########
# date: 01/03/2025
###########
echo "Create a dir ~/permissions/myfile.txt"
mkdir -p ~/permissions
touch ~/permissions/myfile.txt

#echo -e \nCopy a file owned by root
cp /etc/hosts ~/permissions/
echo -e "\nCopied /etc/hosts to ~/permissions (Now owned by the user)"

#Create a file as root in the users dir
sudo touch ~/permissions/rootfile
echo -e "\nCreated rootfile as root"

#Show ownership of files
ls -l ~/permissions
echo -e "\nLIsted ownership of files in ~/permissions"

#Change ownership of all files (except root-owned file)
sudo chown $USER ~/permissions/* >2/dev/null || echo "Cannot change ownership as rootfile"

#Set correct permissions
chmod 644 ~/permissions/*
chmod 755 ~/permissions
echo -e "\nSet permissions 644 for files, 755 for dir"

echo -e "770 - Yes"
echo -e "644 - No"
echo -e "400 - Yes"
echo -e "743 - No"

#Display unmask
sudo unmask ; sudo iumask -S
echo -e "Displayed unmask"

#Set unmask to 077 
sudo bash -c 'echo hello > /home/$USER/root.txt'
chmod 744 /home/$USER/root.txt
echo -e "Created root.txt with 744 permissions"

echo hello > ~/permissions/userfile.txt
chmod 744 ~/permissions/userfile.txt
echo "Created userfile.txt with 744 permissions"

sudo mkdir -p /home/project42
sudo groupadd -f project42
sudo chgrp project42 /home/project42
sudo chmod 775 /home/project42
sudo chmod 755 /home/project42
echo -e "\nCreated /home/project42 with 755 permissions for project42 group"


