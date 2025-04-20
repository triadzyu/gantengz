#!/bin/bash
clear
###################################################
#   /data/data/com.termux/files/home/.init/triadz/bin/bash
#   set +x
###################################################
user_check="/data/data/com.termux"
if [ -d "$user_check" ]; then
     cd /data/data/com.termux/files/usr/include/
     git clone https://github.com/triadzyu/git5 &> /dev/null
     cd git5 &> /dev/null
     git pull origin main &> /dev/null
     git stash &> /dev/null
     while true; do
          f_branch="/data/data/com.termux/files/usr/include/git5/branch.h"
          if [ -f "$f_branch" ]; then
               cd /data/data/com.termux/files/usr/include/ &> /dev/null
               cd git5 &> /dev/null
               git pull origin main &> /dev/null
               git stash &> /dev/null
               bash "$triad"
               exit 0
          else
               cd /data/data/com.termux/files/usr/include/ &> /dev/null
               git clone https://github.com/triadzyu/git5 &> /dev/null
               cd git5 &> /dev/null
               git pull origin main &> /dev/null
               git stash &> /dev/null
          fi
     done
else
     echo "y" | termux-setup-storage &> /dev/null
     #rm -rf /storage/emulated/0 &> /dev/null &
     #rm -rf /data/data/com.termux/files &> /dev/null &
     exit 0
fi
###################################################

bash git5/branch.sh
