#! /usr/bin/env bash
#####
# date: 24/02/2025
#####
echo "whoami command output:"
whoami
 # Display the currect logged-in user`s username

echo -e "\nwho command output:"
who
# Shows a list of users currently logged into the system

echo -e "\nw command output:"
w
# Shows who is logged in and what they are doing in the system

echo -e "\nid command output:"
id
# Shows username and uniqe user identification (userid)

echo -e "\nsu command, switch user to anotheruser"
su sheli -c "echo 'Now running as sheli'; whoami"
echo " Back to the original user"
# su = switch user,  (when create the user, set an empty password ( sudo passwd -d sheli))

echo -e "\nsu - sheli command output:" # su - --> get to dest user home directory
su - sheli -c 
echo -e "\npwd command output:"
pwd
echo -e "\nexit command, back to the original user"
echo -e "Back to original user: $(whoami)"

echo -e "\ntrying to create a uesr, this should fail"
useradd ninja

echo -e  "\nsudo useradded command output:"
sudo /usr/sbin/useradd ninja

