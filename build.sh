#!/bin/bash


CLBlack="\e[0;30m"
CLRed="\e[0;31m"
CLGreen="\e[0;32m"
CLYellow="\e[0;33m"
CLBlue="\e[0;34m"
CLPurple="\e[0;35m"
CLCyan="\e[0;36m"
CLWhite="\e[0;37m"

BGBlack="\e[40m"
BGRed="\e[41m"
BGGreen="\e[42m"
BGYellow="\e[43m"
BGBlue="\e[44m"
BGPurple="\e[45m"
BGCyan="\e[46m"
BGWhite="\e[47m"

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
MAGENTA='\033[1;35m'

tyblue='\e[1;36m'
NC='\e[0m'

b="\033[34;1m";m="\033[31;1m";h="\033[32;1m"
p="\033[39;1m";c="\033[35;1m";u="\033[36;1m"
k="\033[33;1m";n="\033[00m"

b="\033[34;1m"
 p="\033[39;1m"
  k="\033[33;1m"
   m="\033[31;1m"
    h="\033[32;1m"
     c="\033[35;1m"
      pu="\033[36;1m"
       ds="\033[30;1m"
        o="\033[0m"

#############################################################
############ TERMUX REQUIRED PACKAGE
##########################################################

pakettermux=(
    "bash"
    "ffmpeg"
    "xxd"
    "wget"
    "nmap"
    "zip"
    "nmap"
    "jq"
    "bc"
    "screen"
    "vim"
    "httping"
    "gcc"
    "sshpass"
    "perl"
    "git"
    "patchelf"
    "file"
    "clang"
)

check_termux() {
    local pakettermux="$1"
    if ls /data/data/com.termux/files/usr/bin | grep -q "^$pakettermux"; then
        #echo "$pakettermux sudah terpasang.✓"
        printf "${p}[${m}!${p}]${h} $pakettermux terinstall ✓\n"
    else
        echo "$pakettermux belum terpasang. Menginstal $pakettermux..."
        apt install ${pakettermux} -y
        if [ $? -eq 0 ]; then
            echo "$pakettermux berhasil diinstal."
        else
            echo "Gagal menginstal $pakettermux."
            apt-get update -y
            apt-get upgrade -y
            apt install ${pakettermux} --fix-missing
        fi
    fi
}

download_packages_termux() {
    echo "Update dan instal paket"
    for pkg in "${pakettermux[@]}"; do
        check_termux "$pkg"
    done
    sleep 1
}

show_loading() {
  echo -ne "${ORANGE}Memuat..."
  local i=0
  while [ $i -lt 5 ]; do
    echo -n "."
    sleep 0.1
    ((i++))
  done
  echo -e "${NC}"
#clear
}

trap ctrl_c INT
#trap ctrl_d EXIT

ctrl_d() {
    clear
    if [ -f build.sh ]; then rm -f build.sh; fi
    echo -e "proses build telah selesai."
    exit 0
}

ctrl_c() {
    clear
    if [ -f build.sh ]; then rm -f build.sh; fi
    echo -e "proses build telah dibatalkan."
    exit 1
}

display_header() {
#clear
  echo -e "${CYAN}╔══════════════════════════════════════════════════╗${NC}"
  echo -e "${CYAN}║${NC}${GREEN}          █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█                ${NC}${CYAN}║${NC}"
  echo -e "${CYAN}║${NC}${GREEN}          │ MAGELANG ⚡ PHREAKER │                ${NC}${CYAN}║${NC}"
  echo -e "${CYAN}║${NC}${GREEN}          █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█                ${NC}${CYAN}║${NC}"
  echo -e "${CYAN}╠══════════════════════════════════════════════════╣${NC}"
  echo -e "${CYAN}║${NC} ${MAGENTA}📅 Tanggal: $(date '+%A, %d %B %Y')${NC}                ${CYAN}║${NC}"
  echo -e "${CYAN}║${NC} ${MAGENTA}⏰ Waktu: $(date '+%H:%M:%S')${NC}                               ${CYAN}║${NC}"
  echo -e "${CYAN}╚══════════════════════════════════════════════════╝${NC}"
}

function fortermux(){
termux_packages=( "libwebp" "imagemagick" "libarchive" "libandroid-wordexp" "binutils" "coreutils" "ncurses-utils" )
    for paket in "${termux_packages[@]}"; do
        apt install "$paket" -y
    done
}

echo -e "\n\n${CLWhite} Sedang Menjalankan script.${CLYellow} Mohon Tunggu.."
echo -e "${CLWhite} Pastikan Koneksi Internet Lancar\n\n"
show_loading
sleep 2

echo -e "\n\n⌛please wait until finish, dont interupt process...${CYAN}"
fortermux
echo -e "[ ${GREEN}INFO${NC} ] ✔ Success, install dependencies 🔥🔥🔥"

function basic_tools(){
		if [ -z $(command -v curl) ];then
		printf "${p}[${m}!${p}]${m}curl belum di install!!\n"
		printf "${p}[${m}!${p}]${h}pkg install curl\n"
		printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
		exit
		else
		printf "${p}[${m}!${p}]${h} curl terinstall ✓\n"
		fi
		
		if [ -z $(command -v nano) ];then
		printf "${p}[${m}!${p}]${m}nano belum di install!!\n"
		printf "${p}[${m}!${p}]${h}pkg install nano\n"
		printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
		exit
		else
		printf "${p}[${m}!${p}]${h} nano terinstall ✓\n"
		fi
		
		if [ -z $(command -v nslookup) ];then
		printf "${p}[${m}!${p}]${m}nslookup belum di install!!\n"
		printf "${p}[${m}!${p}]${h}pkg install dnsutils\n"
		printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
		pkg install dnsutils
		else
		printf "${p}[${m}!${p}]${h} nslookup terinstall ✓\n"
		fi
}

# ============================================================
if ! command -v which &> /dev/null; then apt install which -y; fi
type -P wget 1>/dev/null
[ "$?" -ne 0 ] && echo "Utillity 'wget' not found, installing" && apt install wget -y
type -P curl 1>/dev/null
[ "$?" -ne 0 ] && echo "Utillity 'curl' not found, installing" && apt install curl -y
type -P nmap 1>/dev/null
[ "$?" -ne 0 ] && echo "Utillity 'nmap' not found, installing" && apt install nmap -y
type -P tput 1>/dev/null
[ "$?" -ne 0 ] && echo "Utillity 'tput' not found, installing ncurses-utils" && apt install ncurses-utils
type -P gpg 1>/dev/null
[ "$?" -ne 0 ] && echo "Utillity 'gpg' not found, installing gnupg" && apt install gnupg -y
type -P lolcat 1>/dev/null
[ "$?" -ne 0 ] && echo "Utillity 'lolcat' not found, installing" && apt install ruby -y && gem install lolcat
# ============================================================

folder_bin=$(which curl | sed 's/curl//g')
termux_bin="/data/data/com.termux/files/usr/bin/"
vps_bin="/usr/bin/"

function instal_nodejs_termux(){
    echo "Menginstall Node_Modules"
    echo ""
    sleep 3
    pkg update && pkg upgrade -y
    #pkg install nodejs -y
    apt install nodejs-lts -y
    node -v
    ln -s ${folder_bin}nodejs ${folder_bin}node
    npm install -g bash-obfuscate
    npm -v
    apt install binutils -y
    apt install ncurses-utils -y
    apt install yarn
    yarn install
    #npm start
}

function dpkg_query(){
    if [ $(dpkg-query -W -f='${Status}' shc 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
        echo belum terinstall shc, we will aquire them now. This may take a while.
        read -p 'Press enter to continue.'
        apt update && apt upgrade -y
        apt install shc
    else
        printf "${p}[${m}!${p}]${h} shc terinstall ✓\n"
    fi
    #if [ $(dpkg-query -W -f='${Status}' nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    if [ $(dpkg-query -W -f='${Status}' nodejs-lts 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
        echo belum terinstall nodejs, we will aquire them now. This may take a while.
        read -p 'Press enter to continue.'
        instal_nodejs_termux
    else
        if [[ ! -f ${termux_bin}npm ]]; then
            instal_nodejs_termux
        fi
        versinpm=$(npm -v)
        printf "${p}[${m}!${p}]${h} npm node js terinstall , npm version: $versinpm ✓\n"
        versinode=$(node -v)
        printf "${p}[${m}!${p}]${h} nodejs-lts terinstall , node version: $versinode ✓\n"
    fi
}

folder_bin=$(which curl | sed 's/curl//g')
if [[ "$folder_bin" = "$termux_bin" ]]; then
    dpkg_query
    download_packages_termux
    basic_tools
else
    echo "please use termux"
    exit 1
fi

echo -e "${BLUE}
Installing new version of config file /data/data/com.termux/files/usr/etc/ssh/sshd_config ...

If you plan to use the 'ssh-agent'
it is recommended to run it as a service.
Run 'pkg i termux-services'
to install the ('runit') service manager

You can enable the ssh-agent service
using 'sv-enable ssh-agent'
You can also enable sshd to autostart
using 'sv-enable sshd'
"
show_loading
display_header
#bash -c \"$(wget -qO- https://raw.githubusercontent.com/triadzyu/gantengz/master/install.sh)\"

echo -e "
Silakan ketik command berikut:

bash -c \"\$(wget -qO- https://raw.githubusercontent.com/triadzyu/gantengz/master/install.sh)\"

"
