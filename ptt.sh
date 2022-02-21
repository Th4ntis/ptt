#!/bin/bash
#
# ptt.sh  Author: Th4ntis
# git clone git@github.com:Th4ntis/ptt.git
#
# Standard Disclaimer: Author assumes no liability for any damage
#
# Still a work in a progress - any constructive criticism welcome.

# status indicators
greenplus='\e[1;33m[++]\e[0m'

install() {
	sudo apt update && sudo apt update -y 
	echo -e "\n $greenplus Installing list of tools through apt \n"
	sudo apt install -y nmap tshark tcpdump wireshark gobuster dirb net-tools curl git default-jre python3 python3-pip libnetfilter-queue-dev libusb-1.0-0-dev libpcap-dev
	echo -e "\n $greenplus Complete! \n"
	install_go
	install_bettercap
	install_kismet
	install_aircrack
	install_hashcat
	install_hcxdumptool
	install_hcxtools
	install_hashcat-utils
	install_mdk4
	install_unicorn
	install_setoolkit
	install_metasploit
	install_impacket
	install_burpsuite
	install_nessus
	install_beef
	install_pixie
	install_reaver
	install_bully
	install_cowpatty
	install_dirbuster
	install_john
	install_seclists
	install_hydra
	install_harvester
	install_sqlmap
	install_peass
	ask_to_install_cuda
	ask_to_install_rtl8812au
	finish
	}

install_go() {
	curl -OL https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
	rm go1.17.7.linux-amd64.tar.gz
	echo "export GOPATH=~/.go" >> ~/.profile
	echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
	source ~/.profile
	}

install_bettercap() {
	echo -e "\n $greenplus Installing Bettercap \n"
	sleep 2
	go install github.com/bettercap/bettercap@latest
#	echo "alias bettercap='sudo ~/.go/bin/bettercap' >> ~/.zshrc"
	sudo ~/.go/bin/bettercap -eval "caplets.update; ui.update; q"
#	echo "alias bettercap-webui='sudo ~/.go/bin/bettercap -caplet http-ui' >> ~/.zshrc"
	echo -e "\n $greenplus bettercap install complete \n"
	sleep 2
	}

install_kismet() {
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

install_aircrack() {
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

install_hashcat() {
	echo -e "\n $greenplus Installing hashcat \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/hashcat/hashcat
	cd hashcat
	sudo make
	sudo make install
	echo -e "\n $greenplus hashcat install complete \n"
	sleep 2
	}

install_hcxdumptool() {
	echo -e "\n $greenplus Installing HCXDumptool \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/ZerBea/hcxdumptool
	cd hcxdumptool
	sudo make
	sudo make install
	echo -e "\n $greenplus hcxdumptool install complete \n"
	sleep 2
	}

install_hcxtools() {
	echo -e "\n $greenplus Installing HCXTools \n"
	sleep 2
	cd /opt/
	sudo apt install -y libcurl4-openssl-dev libssl-dev zlib1g-dev
	sudo git clone https://github.com/ZerBea/hcxtools.git
	cd hcxtools
	sudo make
	sudo make install
	echo -e "\n $greenplus hcxtools install complete \n"
	sleep 2
	}

install_hashcat-utils() {
	echo -e "\n $greenplus Installing Hashat-Utils \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/hashcat/hashcat-utils.git
	cd hashcat-utils/src
	sudo make
	sudo cp *bin ../bin
	echo -e "\n $greenplus hashcat-utils install complete \n"
	sleep 2
	}

install_mdk4() {
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

install_unicorn() {
	echo -e "\n $greenplus Installing Unicorn \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/trustedsec/unicorn.git
	echo -e "\n $greenplus unicorn install complete \n"
	sleep 2
	}

install_setoolkit() {
	echo -e "\n $greenplus Installing SEToolkit \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
	cd setoolkit
	sudo pip3 install -r requirements.txt
	sudo python3 setup.py
	cd /opt/
	echo -e "\n $greenplus SET install complete \n"
	sleep 2
	}

install_metasploit() {
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

install_impacket() {
	echo -e "\n $greenplus Installing Impacket \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/SecureAuthCorp/impacket.git && cd impacket
	sudo python3 -m pip install .
	echo -e "\n $greenplus Impacket install complete \n"
	sleep 2
	}

install_burpsuite() {
	echo -e "\n $greenplus Installing Burpsuite \n"
	sleep 2
	cd /home/$USER/
	curl -o /home/$USER/BurpSuite_Community_2020_9_1.sh "https://portswigger.net/burp/releases/download?product=community&version=2022.1.1&type=Linux"
	chmod +x /home/$USER/BurpSuite_Community_2020_9_1.sh
	sudo ./BurpSuite_Community_2020_9_1.sh
	sudo rm -r /home/$USER/BurpSuite*
	echo -e "\n $greenplus Burpsuite install complete \n"
	sleep 2
	}

install_nessus() {
	echo -e "\n $greenplus Installing Nessus \n"
	sleep 2
	xdg-open https://www.tenable.com/downloads/nessus?loginAttempted=true
	echo -e "\n $greenplus Nessus install complete \n"
	sleep 2
	}

#install_openvas() {
	#echo -e "\n $greenplus Installing OpenVAS \n"
	#sleep 2
	#X
	#echo -e "\n $greenplus OpenVAS install complete \n"
	#sleep 2
#	}

install_beef() {
	echo -e "\n $greenplus Installing BeEF \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/beefproject/beef.git && cd beef
	sudo ./install
#	echo "alias beef='cd /opt/beef && sudo ./beef' >> ~/.zshrc"
	echo -e "\n $greenplus BeEF install complete \n"
	sleep 2
	}

install_pixie() {
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

install_reaver() {
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

install_bully() {
	echo -e "\n $greenplus Installing Bully \n"
	sleep 2
	sudo apt install -y build-essential libpcap-dev
	cd /opt/
	sudo git clone https://github.com/kimocoder/bully.git
	cd bully*/ && cd src/
	sudo make
	sudo make install
	cd /opt/
	echo -e "\n $greenplus bully install complete \n"
	sleep 2
	}

install_cowpatty() {
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

install_dirbuster() {
	echo -e "\n $greenplus Installing DirBuster \n"
	sleep 2
	cd /opt/
	sudo git clone https://gitlab.com/kalilinux/packages/dirbuster.git
	sudo sed -i 's@DirBuster-1.0-RC1.jar@/opt/dirbuster/DirBuster-1.0-RC1.jar@g' /opt/dirbuster/DirBuster-1.0-RC1.sh
#	echo "alias dirbuster='sudo /opt/dirbuster/DirBuster-1.0-RC1.sh' >> ~/.zshrc"
	echo -e "\n $greenplus DirBuster install complete \n"
	sleep 2
	}

install_john() {
	echo -e "\n $greenplus Installing John The Ripper \n"
	sleep 2
	cd /opt/
	sudo apt-get -y install git build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev nvidia-opencl-dev cmake bison flex clang
	sudo git clone --recursive https://github.com/teeshop/rexgen.git && cd rexgen
	sudo ./install.sh
	sudo ldconfig
	cd /opt/
	sudo git clone https://github.com/openwall/john -b bleeding-jumbo john
	cd /opt/john/src
	sudo ./configure --enable-rexgen && sudo make -s clean && sudo make -sj4
	sudo make shell-completion
	echo -e "\n $greenplus John install complete \n"
	sleep 2
	}

install_seclists() {
	echo -e "\n $greenplus Installing SecLists \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/danielmiessler/SecLists.git
	echo -e "\n $greenplus SecLists install complete \n"
	sleep 2
	}

install_hydra() {
	echo -e "\n $greenplus Installing THC-hydra \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/vanhauser-thc/thc-hydra.git && cd thc-hydra
	sudo ./configure
	sudo make
	sudo make install
	echo -e "\n $greenplus THC-Hydra install complete \n"
	sleep 2
	}

install_harvester() {
	echo -e "\n $greenplus Installing Harvester \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/laramies/theHarvester.git && cd theHarvester
	sudo python3 -m pip install -r requirements/base.txt
#	echo "alias theHarvester='cd /opt/theHarvester && python3 theHarvester.py -h' >> ~/.zshrc"
	echo -e "\n $greenplus Harvester install complete \n"
	sleep 2
	}

install_sqlmap() {
	echo -e "\n $greenplus Installing SQLMap \n"
	sleep 2
	cd /opt/
	sudo git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
#	echo "alias sqlmap='python3 /opt/sqlmap/sqlmap.py' >> ~/.zshrc"
	echo -e "\n $greenplus SQLMap install complete \n"
	sleep 2
	}

install_peass() {
	echo -e "\n $greenplus Installing PEASS \n"
	sleep 2
	cd /opt/
	sudo git clone https://github.com/carlospolop/PEASS-ng.git
	echo -e "\n $greenplus PEASS install complete \n"
	sleep 2
	}

ask_to_install_rtl8812au() {
	read -e -p " Install Driver for RTL8812AU WiFi adapter?: " choice
	[[ "$choice" == [Yy]* ]] && rtl8812au_install || echo -e "\n Not installing RTL8812AU driver, continuing script... \n"
	}

rtl8812au_install () {
	echo -e "\n $greenplus Installing RTL8812AU driver \n"
    sleep 2
    cd /opt/
    sudo git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au.git
	cd rtl8812au && sudo make && sudo make install
    echo -e "\n $greenplus RTL8812AU driver install complete \n \n"
    sleep 2
    }

ask_to_install_cuda() {
	read -e -p " Install Cuda?: " choice
	[[ "$choice" == [Yy]* ]] && cuda_install || echo -e "\n Not installing cuda, continuing script... \n"
	}

cuda_install () {
	echo -e "\n $greenplus Installing Cuda \n"
    sleep 2
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
    sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub
    sudo apt update
    sudo apt -y install cuda
    rm cuda*
    echo -e "\n $greenplus cuda install complete \n \n"
    sleep 2
    }

finish() {
	clear
	echo -e "\n All finished! Happy Hacking! :) \n"
	}

install