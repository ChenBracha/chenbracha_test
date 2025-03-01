#!/bin/bash
#########
# date: 01/03/2025
#########
echo "Create groups:tennis, football and sports"
sudo groupadd tennis ; sudo  groupadd football ; sudo groupadd sports
echo -e "\nVenus was added to be a member of tennis and sports group, if you dont have user named 'venus' please create manually"
sudo usermod -a -G tennis,sports venus 2>/dev/null && echo "venus was added to tennis and sports group" || echo "User serena does not exits or it already in the group"

echo -e "\nChange the football group name to foot"
sudo groupmod -n foot football

echo -e "\nAdding serena to tennis group"
sudo usermod -aG tennis serena 2>/dev/null && echo "serena was added to tennis group"  || echo "User serena does not exits"

echo -e "\nid command to verify that serena is a member of tennis"
id serena || "User serena does no exits"

echo -e "\nserena was added to be the manager of foot and sports group"
sudo gpasswd -A serena sports && echo "serena is the new manager group of 'sports'" || echo "serena is already the manager of the group, or the user is not exits"
sudo gpasswd -A serena foot && echo "serena is the new manager group of 'foot'" || echo "serena is already the manager of the group" || echo "user is already the manager of the group or it doest exits"

