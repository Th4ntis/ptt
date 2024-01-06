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
	sudo apt install -y aircrack-ng autoconf automake bison build-essential bully clang cmake crunch curl default-jre dirb docker.io docker-compose ethtool ettercap-common ettercap-graphical flex git golang-go gpsd gpsd-clients gpsd-tools hostapd iw john libbz2-dev libcmocka-dev libcurl4-openssl-dev libgmp-dev libhwloc-dev libnl-3-dev libnl-genl-3-dev libpcap-dev libpcre3-dev libsqlite3-dev libssl-dev libtool lighttpd net-tools nmap nvidia-opencl-dev pkg-config proxychains4 python3 python3-pip reaver rfkill screen shtool tcpdump tshark usbutils wireshark wpasupplicant yasm zlib1g-dev
 	echo -e "\n $greenplus Complete! \n"
	install_go
	install_bettercap
 	install_kerbrute
 	install_ffuf
	install_gobuster
	install_kismet
	install_hashcat
	install_hcxdumptool
	install_hcxtools
	install_hashcat-utils
	install_mdk4
	install_wifite
	install_unicorn
	install_setoolkit
	install_bloodhound
	install_metasploit
	install_impacket
	install_burpsuite
	install_nessus
	install_dirbuster
	install_enum4linux
	install_seclists
	install_nikto
	install_responder
	install_evilwinrm
	install_spiderfoot
	install_smbmap
	install_hydra
	install_harvester
	install_sqlmap
	install_peass
	ask_to_install_cuda
	ask_to_install_rtl8812au
	finish
	}

install_go() {
	echo 'export GOPATH="$HOME/.go"' >> ~/.zshrc
	echo 'export PATH="$PATH:${GOPATH//://bin:}/bin"' >> ~/.zshrc
	source ~/.zshrc
	mkdir -p ~/.go/{bin,pkg,src}
	}

install_bettercap() {
	echo -e "\n $greenplus Installing Bettercap \n"
	sleep 2
	sudo apt instal -y libnetfilter-queue-dev libusb-1.0-0-dev libpcap-dev
	go install github.com/bettercap/bettercap@latest
	sudo ~/.go/bin/bettercap -eval "caplets.update; ui.update; q"
	echo -e "\n $greenplus Bettercap install complete \n"
	sleep 2
	}

 install_ffuf() {
 	echo -e "\n $greenplus Installing Ffuf \n"
	sleep 2
	go install github.com/ffuf/ffuf/v2@latest
 	echo -e "\n $greenplus Ffuf install complete \n"
	sleep 2
	}

install_kerbrute() {
	echo -e "\n $greenplus Installing Kerbrute \n"
	sleep 2
	go install github.com/ropnop/kerbrute@latest
	echo -e "\n $greenplus Kerbrute install complete \n"
	sleep 2
	}

install_gobuster() {
	echo -e "\n $greenplus Installing Gobuster \n"
	sleep 2
	go install github.com/OJ/gobuster/v3@latest
	echo -e "\n $greenplus Gobuster install complete \n"
	sleep 2
	}

install_kismet() {
	echo -e "\n $greenplus Installing Kismet \n"
	sleep 2
	sudo rm -rfv /usr/local/bin/kismet* /usr/local/share/kismet* /usr/local/etc/kismet*
	sudo apt install -y build-essential git libwebsockets-dev pkg-config rtl-433 zlib1g-dev libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libnm-dev libdw-dev libsqlite3-dev libprotobuf-dev libprotobuf-c-dev protobuf-compiler protobuf-c-compiler libsensors4-dev libusb-1.0-0-dev python3 python3-setuptools python3-protobuf python3-requests python3-numpy python3-serial python3-usb python3-dev python3-websockets librtlsdr0 libubertooth-dev libbtbb-dev libmosquitto-dev
	cd /opt/ && sudo git clone https://www.kismetwireless.net/git/kismet.git && cd kismet
	sudo ./configure
	sudo make
	sudo make -j$(nproc)
	sudo make suidinstall
	sudo usermod -aG kismet $USER
	echo -e "\n $greenplus kismet install complete \n"
	sleep 2
	}

install_hashcat() {
	echo -e "\n $greenplus Installing hashcat \n"
	sleep 2
 	sudo apt install -y ocl-icd-libopencl1 pocl-opencl-icd
	cd /opt/ && sudo git clone https://github.com/hashcat/hashcat && cd hashcat && sudo make && sudo make install
	echo -e "\n $greenplus hashcat install complete \n"
	sleep 2
	}

install_hcxdumptool() {
	echo -e "\n $greenplus Installing HCXDumptool \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/ZerBea/hcxdumptool && cd hcxdumptool && sudo make && sudo make install
	echo -e "\n $greenplus hcxdumptool install complete \n"
	sleep 2
	}

install_hcxtools() {
	echo -e "\n $greenplus Installing HCXTools \n"
	sleep 2
	sudo apt install -y libcurl4-openssl-dev
 	cd /opt/ && sudo git clone https://github.com/ZerBea/hcxtools.git && cd hcxtools && sudo make && sudo make install
	echo -e "\n $greenplus hcxtools install complete \n"
	sleep 2
	}

install_hashcat-utils() {
	echo -e "\n $greenplus Installing Hashat-Utils \n"
	sleep 2
 	cd /opt/ && sudo git clone https://github.com/hashcat/hashcat-utils.git && cd hashcat-utils/src && sudo make && sudo cp *bin ../bin
	echo -e "\n $greenplus hashcat-utils install complete \n"
	sleep 2
	}

install_spiderfoot() {
	cd /opt/ && sudo git clone https://github.com/smicallef/spiderfoot.git && cd spiderfoot && pip3 install -r requirements.txt
#	python3 ./sf.py -l 127.0.0.1:5001 # Starts Spiderfoot
	}

install_mdk4() {
	echo -e "\n $greenplus Installing MDK4 \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/aircrack-ng/mdk4 && cd mdk4 && sudo make && sudo make install
	echo -e "\n $greenplus mdk4 install complete \n"
	sleep 2
	}

install_wifite() {
	echo -e "\n $greenplus Installing Wifite \n"
	sleep 2
 	cd /opt/ && git clone https://github.com/kimocoder/wifite2.git && cd wifite2
	pip3 install -r requirements.txt
 	sudo pip3 install -r requirements.txt
 	sudo python3 setup.py install
  	echo -e "\n $greenplus Wifite install complete \n"
	sleep 2
	}

install_unicorn() {
	echo -e "\n $greenplus Installing Unicorn \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/trustedsec/unicorn.git
	echo -e "\n $greenplus unicorn install complete \n"
	sleep 2
	}

install_setoolkit() {
	echo -e "\n $greenplus Installing SEToolkit \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/ && cd setoolkit && sudo pip3 install -r requirements.txt && sudo python3 setup.py
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

	sudo apt-key export 2007B954 | sudo gpg --dearmour -o /opt/keyrings/metasploit.gpg
 	sudo echo 'deb [arch=amd64 signed-by=/opt/keyrings/metasploit.gpg] http://downloads.metasploit.com/data/releases/metasploit-framework/apt lucid main' | sudo tee /etc/apt/sources.list.d/metasploit-framework.list > /dev/null
	echo -e "\n $greenplus metasploit install complete \n"
	sleep 2
	}

install_impacket() {
	echo -e "\n $greenplus Installing Impacket \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/SecureAuthCorp/impacket.git && cd impacket && sudo python3 -m pip install .
	echo -e "\n $greenplus Impacket install complete \n"
	sleep 2
	}

install_burpsuite() {
	echo -e "\n $greenplus Installing Burpsuite \n"
	sleep 2
	firefox https://portswigger.net/burp/communitydownload
	echo -e "\n $greenplus Burpsuite install complete \n"
	sleep 2
	}

install_bloodhound() {
	sudo apt install -y openjdk-11-jdk apt-transport-https
	firefox https://bloodhound.readthedocs.io/en/latest/installation/linux.html #install-neo4j
	firefox https://github.com/BloodHoundAD/BloodHound/releases
	}

install_nessus() {
	echo -e "\n $greenplus Opening Nessus Download Page... \n"
	sleep 2
	nessus_amd64_file=$(curl https://www.tenable.com/downloads/nessus\?loginAttempted\=true | grep -o -m1 -E "Nessus-[0-9]{1,2}.[0-9]{1}.[0-9]{1}-debian10_amd64.deb" | grep -m1 -i ".deb")
	nessus_amd64="https://www.tenable.com/downloads/api/v2/pages/nessus/files/$nessus_amd64_file"
	wget -q $nessus_amd64 -O /tmp/nessus_amd64.deb
	sudo dpkg -i /tmp/nessus_amd64.deb
	rm -f /tmp/nessus_amd64.deb
	sleep 5
	}

install_beef() {
	echo -e "\n $greenplus Installing BeEF \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/beefproject/beef.git && cd beef && sudo ./install
	echo -e "\n $greenplus BeEF install complete \n"
	sleep 2
	}

install_dirbuster() {
	echo -e "\n $greenplus Installing DirBuster \n"
	sleep 2
	cd /opt/ && sudo git clone https://gitlab.com/kalilinux/packages/dirbuster.git && sudo sed -i 's@DirBuster-1.0-RC1.jar@/opt/dirbuster/DirBuster-1.0-RC1.jar@g' /opt/dirbuster/DirBuster-1.0-RC1.sh
	echo -e "\n $greenplus DirBuster install complete \n"
	sleep 2
	}

install_enum4linux() {
	echo -e "\n $greenplus Installing enum4linux \n"
	sleep 2
	cd /opt/ && sudo git clone https://gitlab.com/kalilinux/packages/enum4linux.git
	echo -e "\n $greenplus enum4Linux install complete \n"
	sleep 2
	}

install_seclists() {
	echo -e "\n $greenplus Installing SecLists \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/danielmiessler/SecLists.git
	echo -e "\n $greenplus SecLists install complete \n"
	sleep 2
	}

install_hydra() {
	echo -e "\n $greenplus Installing THC-hydra \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/vanhauser-thc/thc-hydra.git && cd thc-hydra && sudo ./configure && sudo make && sudo make install
	echo -e "\n $greenplus THC-Hydra install complete \n"
	sleep 2
	}

install_responder() {
	echo -e "\n $greenplus Installing Responder \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/lgandx/Responder.git
	echo -e "\n $greenplus Responder install complete \n"
	sleep 2
	}

install_evilwinrm() {
	echo -e "\n $greenplus Installing Evil-WinRM \n"
	sleep 2
	sudo gem install bundler winrm winrm-fs stringio logger fileutils
	cd /opt/ && sudo git clone https://github.com/Hackplayers/evil-winrm.git
	sudo gem install evil-winrm
	echo -e "\n $greenplus Evil-WinRM install complete \n"
	sleep 2
	}

install_nikto() {
	echo -e "\n $greenplus Installing Nikto \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/sullo/nikto
	echo -e "\n $greenplus Nikto install complete \n"
	sleep 2
	}

install_smbmap() {
	echo -e "\n $greenplus Installing SMBMap \n"
	sleep 2
	cd /opt/ && sudo pip3 install smbmap
	echo -e "\n $greenplus SMBMap install complete \n"
	sleep 2
	}

install_harvester() {
	echo -e "\n $greenplus Installing Harvester \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/laramies/theHarvester.git && cd theHarvester && sudo python3 -m pip install -r requirements/base.txt
	echo -e "\n $greenplus Harvester install complete \n"
	sleep 2
	}

install_sqlmap() {
	echo -e "\n $greenplus Installing SQLMap \n"
	sleep 2
	cd /opt/ && sudo git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
	echo -e "\n $greenplus SQLMap install complete \n"
	sleep 2
	}

install_peass() {
	echo -e "\n $greenplus Installing PEASS \n"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/carlospolop/PEASS-ng.git
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
    cd /opt/ && sudo git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au.git && cd rtl8812au && sudo make && sudo make install
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
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/12.2.1/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.1-535.86.10-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.1-535.86.10-1_amd64.deb
    sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /opt/keyrings/
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
