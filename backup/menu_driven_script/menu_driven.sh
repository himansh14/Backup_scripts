#!/bin/bash

# creating a menu diven program to display n/w details like CPU, open port, free disk, ram etc

echo "SELECT YOUR METRICS FROM THE FOLLOWING"

WHOAMI=$(whoami)
echo "1. WHOAMI"

USER=$(uname)
echo "2. USER"

DATE=$(date)
echo "3. DATE"

UPTIME=$(uptime)
echo "4. UPTIME"

PROCESS=$(ps)
echo "5. PROCESS"

FREESPACE=$(free)
echo "6. FREESPACE"

DISKFREE=$(df -h | grep udev)
echo "7. DISKFREE"

IP_ADDRESS=$(ifconfig | sed -n '2p')
echo "8. IP_ADDRESS"

INODE=$(ls -i)
echo "9. INODE"

STATISTICS=$(vmstat -t)
echo "10. STATISTICS"

MOUNT=$(df -h | grep /dev/xvda15) 
echo "11. MOUNT"

BLOCK_STORAGE=$(lsblk)
echo "12. BLOCK_STORAGE"

NETSTAT=$(netstat -tunlp)
echo "13. NETSTAT"

TOP=$(top | sed '5q')
echo "14. TOP"

IFCONFIG=$(ifconfig)
echo "15. IFCONFIG"

FDISK=$(fdisk -l)
echo "16. FDISK"

WORD_COUNT=$(wc /opt/all_data_backup/backup/clearram.sh)
echo "17. WORD_COUNT"

IP_ADDR=$(ip addr)
echo "18. IP_ADDR"

ARP=$(arp)
echo "19. ARP"
 
DIG=$(dig)
echo "20. DIG"

echo -n "Enter your choices from [1-20]: "

while read -r choice; do 

# case statement is used to compare one value with the multiple cases.
 
case $choice in 

# Pattern 1 
1) echo "You have selected option 1"
   echo "$WHOAMI";;

# Pattern 2
2) echo "You have selected option 2"
   echo "$USER";;

# Pattern 3
3) echo "You have selected option 3"
   echo "$DATE";;

# Pattern 4
4) echo "You have selected option 4"
   echo "$UPTIME";;

# Pattern 5
5) echo "You have selected option 5"
   echo "$PROCESS";;

# Pattern 6
6) echo "You have selected option 6"
   echo "$FREESPACE";;

# Pattern 7
7) echo "You have selected option 7"
   echo "$DISKFREE";;

# Pattern 8
8) echo "You have selected option 8"
   echo "$IP_ADDRESS";;

# Pattern 9
9) echo "You have selected option 9"
   echo "$INODE";;

# Pattern 10
10) echo "You have selected option 10"
    echo "$STATISTICS";;

# Pattern 11
11) echo "You have selected option 11"
    echo "$MOUNT";;

# Pattern 12
12) echo "You have selected option 12"
    echo "$BLOCK_STORAGE";; 

# Pattern 13
13) echo "You have selected option 13"
    echo "$NETSTAT";; 

# Pattern 14
14) echo "You have selected option 14"
    echo "$TOP";; 

# Pattern 15
15) echo "You have selected option 15"
    echo "$IFCONFIG";; 

# Pattern 16
16) echo "You have selectef option 16"
    echo "$FDISK";;

# Pattern 17
17) echo "You have selected option 17"
    echo "$WORD_COUNT";; 

# Pattern 18
18) echo "You have selected option 18"
    echo "$IP_ADDR";;

# Pattern 19
19) echo "You have selected option 19"
    echo "$ARP";;

# Pattern 20
20) echo "You have selected option 20"
    echo "$DIG";; 

21) echo "Quit"
    exit;;

# Default Pattern 
*) echo "Invalid Option";;

esac
   echo -n "Enter your choices from [1-20]: "

done
