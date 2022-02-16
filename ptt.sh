#!/bin/bash
#
# ptt.sh  Author: Th4ntis
# git clone git@github.com:Th4ntis/ptt.git
# command line arguments are valid, only catching 1 arguement
#
# Standard Disclaimer: Author assumes no liability for any damage

# status indicators
    greenplus='\e[1;33m[++]\e[0m'
    greenminus='\e[1;33m[--]\e[0m'
    redexclaim='\e[1;31m[!!]\e[0m'
    blinkexclaim='\e[1;31m[\e[5;31m!!\e[0m\e[1;31m]\e[0m'

# variables moved from local to global
    detected_env=""

check_distro() {
    distro=$(uname -a | grep -i -c "ubuntu") # distro check
    if [ $distro -ne 1 ]
     then echo -e "\n $blinkexclaim Ubuntu Linux Not Detected... $blinkexclaim \n"; exit
    fi
    }

pentest_install () {
    apt_update && apt_update_complete
    echo -e "\n $greenplus Installing list of tools through apt \n"
    sudo apt install -y nmap sqlmap tshark tcpdump wireshark net-tools
    echo -e "\n $greenplus Complete! \n"
    sleep 2
    bettercap_install
    kismet_install
    aircrack_install
    hashcat_install
    ask_to_install_cuda
    mdk4_install
    unicorn_install
    set_install
    metasploit_install
    impacket_install
    burpsuite_install
    pixie_install
    reaver_install
    bully_install
    cowpatty_install
    }

bettercap_install () {
    echo -e "\n $greenplus Installing Bettercap \n"
    sleep 2
    # Downloads and Installs GO, adds it to $PATH
    sudo apt install -y build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev golang git
    echo "# GOPath" >> /home/$USER/.profile
    echo "export GOPATH=$HOME/go" >> /home/$USER/.profile
    echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> /home/$USER/.profile
    source /home/$USER/.profile

    # Installs Bettercap
    go get github.com/bettercap/bettercap
    cd $GOPATH/src/github.com/bettercap/bettercap
    make build
    sudo make install

    #Installs Bettercap WebUI
    sudo bettercap -eval "caplets.update; ui.update; q"
    cat >> /home/$USER/.bashrc << 'EOF'
    alias bettercap-webui='sudo bettercap -caplet http-ui'
EOF
    source /home/$USER/.bashrc
    echo -e "\n $greenplus bettercap install complete \n"
    sleep 2
    }

kismet_install () {
    echo -e "\n $greenplus Installing Kismet \n"
    sleep 2
    sudo rm -rfv /usr/local/bin/kismet* /usr/local/share/kismet* /usr/local/etc/kismet*
    wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -
    echo 'deb https://www.kismetwireless.net/repos/apt/release/focal focal main' | sudo tee /etc/apt/sources.list.d/kismet.list
    sudo apt update >/dev/null 2>&1
    sudo apt install -y kismet
    sudo usermod -aG kismet $USER
    sudo apt upgrade -y
    echo -e "\n $greenplus kismet install complete \n"
    sleep 2
    }

aircrack_install () {
    echo -e "\n $greenplus Installing Aircrack \n"
    sleep 2
    sudo apt install -y build-essential autoconf automake libtool pkg-config libnl-3-dev libnl-genl-3-dev libssl-dev ethtool shtool rfkill zlib1g-dev libpcap-dev libsqlite3-dev libpcre3-dev libhwloc-dev libcmocka-dev hostapd wpasupplicant tcpdump screen iw usbutils
    cd /opt/
    sudo wget https://download.aircrack-ng.org/aircrack-ng-1.6.tar.gz
    sudo tar -zxvf aircrack-ng-1.6.tar.gz
    cd aircrack-ng-1.6
    sudo autoreconf -i
    ./configure --with-experimental
    sudo make
    sudo make install
    sudo ldconfig
    cd /opt/
    sudo rm aircrack-ng-1.6.tar.gz
    echo -e "\n $greenplus aircrack install complete \n"
    sleep 2
    }

hashcat_install () {
    echo -e "\n $greenplus Installing Hashcat, HCXDUmpTool, HCXTools, and Hashcat Utils \n"
    sleep 2
    # Installs Hashcat
    cd /opt/
    sudo git clone https://github.com/hashcat/hashcat
    cd hashcat
    sudo make
    sudo make install
    cd /opt/

    # Installs HCXDumpTool
    cd /opt/
    sudo git clone https://github.com/ZerBea/hcxdumptool
    cd hcxdumptool
    sudo make
    sudo make install
    cd /opt/

    # Install hcxtools
    cd /opt/
    sudo apt install -y libcurl4-openssl-dev libssl-dev zlib1g-dev
    sudo git clone https://github.com/ZerBea/hcxtools.git
    cd hcxtools
    sudo make
    sudo make install
    cd /opt/

    # Installs Hashcat Utils
    cd /opt/
    sudo git clone https://github.com/hashcat/hashcat-utils.git
    cd hashcat-utils/src
    sudo make
    sudo cp *bin ../bin
    cd /opt/
    echo -e "\n $greenplus hashcat install complete \n"
    sleep 2
    }

ask_to_install_cuda () {
    read -e -p " Install Cuda?: " choice
    [[ "$choice" == [Yy]* ]] && cuda_install || echo -e "\n Not installing cuda, continuing script... \n"
    }

cuda_install () {
    echo -e "\n $greenplus Installing Cuda \n"
    sleep 2
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
    sudo apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
    sudo apt update
    sudo apt -y install cuda
    rm cuda*
    echo -e "\n $greenplus cuda install complete \n \n"
    sleep 2
    }

mdk4_install () {
    echo -e "\n $greenplus Installing MDK4 \n"
    sleep 2
    sudo apt install -y pkg-config libnl-3-dev libnl-genl-3-dev libpcap-dev
    cd /opt/
    sudo git clone https://github.com/aircrack-ng/mdk4
    cd mdk4
    sudo make
    sudo make install
    cd /opt/
    echo -e "\n $greenplus mdk4 install complete \n"
    sleep 2
    }

unicorn_install () {
    echo -e "\n $greenplus Installing Unicorn \n"
    sleep 2
    cd /opt/
    sudo git clone https://github.com/trustedsec/unicorn.git
    echo -e "\n $greenplus unicorn install complete \n"
    sleep 2
    }

set_install () {
    echo -e "\n $greenplus Installing SEToolkit \n"
    sleep 2
    cd /opt/
    sudo git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
    cd setoolkit
    sudo pip3 install -r requirements.txt
    sudo python3 setup.py
    cd /opt/
    echo -e "\n $greenplus set install complete \n"
    sleep 2
    }

metasploit_install () {
    echo -e "\n $greenplus Installing Metasploit \n"
    sleep 2
    cd /home/$USER/
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
    chmod 755 /home/$USER/msfinstall
    ./msfinstall
    rm /home/$USER/msfinstall
    echo -e "\n $greenplus metasploit install complete \n"
    sleep 2
    }

impacket_install () {
    echo -e "\n $greenplus Installing Impacket \n"
    sleep 2
    cd /opt/
    sudo git clone https://github.com/SecureAuthCorp/impacket.git
    cd impacket
    sudo pip3 install .
    echo -e "\n $greenplus impacket install complete \n"
    sleep 2
    }

burpsuite_install () {
    echo -e "\n $greenplus Installing Burpsuite \n"
    sleep 2
    cd /home/$USER/
    curl -o /home/$USER/BurpSuite_Community_2020_9_1.sh "https://portswigger.net/burp/releases/download?product=community&version=2020.9.1&type=Linux"
    chmod +x /home/$USER/BurpSuite_Community_2020_9_1.sh
    sudo ./BurpSuite_Community_2020_9_1.sh
    sudo rm -r /home/$USER/BurpSuite*
    echo -e "\n $greenplus burpsuite install complete \n"
    sleep 2
    }

pixie_install () {
    echo -e "\n $greenplus Installing PixieWPS \n"
    sleep 2
    cd /opt/
    sudo git clone https://github.com/wiire/pixiewps
    cd pixiewps/
    sudo make
    sudo make install
    cd /opt/
    echo -e "\n $greenplus pixie install complete \n"
    sleep 2
    }

reaver_install () {
    echo -e "\n $greenplus Installing Reaver \n"
    sleep 2
    sudo apt install -y build-essential libpcap-dev
    cd /opt/
    sudo git clone https://github.com/t6x/reaver-wps-fork-t6x
    cd reaver-wps-fork-t6x*
    cd src
    sudo ./configure
    sudo make
    sudo make install
    cd /opt/
    echo -e "\n $greenplus reaver install complete \n"
    sleep 2
    }

bully_install () {
    echo -e "\n $greenplus Installing Bully \n"
    sleep 2
    sudo apt install -y build-essential libpcap-dev
    cd /opt/
    sudo git clone https://github.com/aanarchyy/bully
    cd bully*/
    cd src/
    sudo make
    sudo make install
    cd /opt/
    echo -e "\n $greenplus bully install complete \n"
    sleep 2
    }

cowpatty_install () {
    echo -e "\n $greenplus Installing Cowpatty \n"
    sleep 2
    cd /opt/
    sudo wget http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz
    sudo tar zxfv cowpatty-4.6.tgz
    cd cowpatty-4.6
    sudo make
    sudo make install
    cd /opt/
    sudo rm cowpatty-4.6.tgz
    echo -e "\n $greenplus cowpatty install complete \n"
    sleep 2
    }

# ascii art
asciiart=$(base64 -d <<< "H4sIAAAAAAAAA2VPwRHAMAj6Zwo2YINM4l0XcfgqqWlsfdQiiOS6qtDqi2vaxX/VsC2IPwmECbhg
WyE2/VWVzYCnMj5iwzaXYNq0Nalguvn0dOwqMXYYYhFEuXh2TVhxWFHXEfqpirATMwzrvNaY0AV8
UTxevB9GU5uvypWWkbBuHosd/OuhmypsfdyP1wFn4gEAAA=="  | gunzip )

buntu-setup_menu () {
    clear
    echo -e "$asciiart"
    echo -e "\n  Select a option:"
    echo -e "\n **THIS SCRIPT DOES REQUIRE MINOR INPUT FROM THE USER**"
    echo -e "\n  Menu Options:"
    echo -e "  1 - Basics Install          (Installs basic tools and software such as linux headers, dkms, etc...)"
    echo -e "  2 - Install Pentest Tools   (Installs useful and common pentest tools, such as metaploit, Impacket, etc...)"
    echo -e "  3 - Both                    (Fixes various system settings, such as shortcuts etc...)"
    read -n1 -p "  Enter 1 thru 3 or press X to exit: " menuinput

    case $menuinput in
        1) basic_install;;
        2) pentest_install;;
        3) install_all;;

      x|X) echo -e "\n\n Exiting buntu-setup.sh! \n" ;;
      *) buntu-setup_menu ;;
    esac
    }

buntu-setup_help () {
    echo -e "\n valid command line arguements are : \n \n --basic        run basic install \n"\
            "--pentest        install pentest tools \n --settings         fixes settings"\
            "\n --fresh   Runs everything"\
    exit
    }

check_arg () {
    if [ "$1" == "" ]
      then buntu-setup_menu
     else
      case $1 in
      --menu) buntu-setup_menu                 ;;
     --basic) basic_install                    ;;
   --pentest) pentest_install                  ;;
  --settings) settings_modify                  ;;
     --fresh) fresh_install                    ;;
      *) buntu-setup_help ; exit 0             ;;
    esac
    fi
    }

exit_screen () {
    clear
    echo -e "$asciiart"
    echo -e "\n\n    All finished! Happy Hacking! :) \n"

    exit
    }

#check_for_root
check_distro
check_arg "$1"
exit_screen
