#!/bin/bash
if [ ! -d "$HOME/toolsv7" ]; then
mkdir -p $HOME/toolsv7
fi
###################################################
e="echo -e "
update() {
cd $HOME/toolsv7
git pull origin main
git stash
cd /data/data/com.termux/files/usr/share/
git clone https://github.com/triadzyu/pocky
cd pocky
git pull origin main
git stash
mv -f xxh3.h /data/data/com.termux/files/usr/include
}
counter=0
    while [ $counter -lt 2 ]; do
        clear
        scanning="/data/data/com.termux/files/usr/include/xxh3.h" &> /dev/null
        if [ -f "$scanning" ]; then
            cd $HOME/toolsv7 &> /dev/null
            git pull origin main &> /dev/null
            git stash &> /dev/null
            cd /data/data/com.termux/files/usr/share/pocky &> /dev/null
            git pull origin main &> /dev/null
            git stash &> /dev/null
            mv -f xxh4.h /data/data/com.termux/files/usr/include &> /dev/null
            bash $scanning
            exit
        else
            clear
            $e "Mengupdate Toolsv7"
            update &> /dev/null
        fi
        counter=$((counter + 1))
    done###################################################

bash ./pocky/xxh3.sh
