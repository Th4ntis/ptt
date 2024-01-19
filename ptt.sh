#!/bin/bash
#
# ptt.sh  Author: Th4ntis
# git clone git@github.com:Th4ntis/ptt.git
#
# Standard Disclaimer: Author assumes no liability for any damage
#
# This is my personal list of tools I use and like to play with on engagements and CTFs. I use ZSH so this will be working with the .zshrc file. All tools installed with GO are under ~/.go/
# Still a work in a progress - any constructive criticism welcome.

# status indicators
greenplus='\e[1;33m[++]\e[0m'

install() {
	setup
	sudo apt install -y aircrack-ng dirb docker.io docker-compose golang-go gpsd gpsd-clients gpsd-tools nmap pipx proxychains4 python3 python3-pip sshuttle wireshark
	pipx ensurepath
	install_go
	install_joplin
        install_recon-ng
        install_amass
        install_subfinder
        install_ffuf
        install_nikto
        install_shodancli
        install_gobuster
        install_dirbuster
	install_sqlmap
        install_aircrkack
        install_hashcat
        install_hashcat-utils
        install_hcxdumptools
        install_hcxtools
        install_bettercap
        install_kismet
        install_mdk4
        install_rtl8812au-drivers
        install_seclists
        install_burpsuite
        install_onelist
	install_onerule
	install_slun
        install_metasploit
        install_peass
	install_smbmap
        install_responder
        install_impacket
        install_hydra
        install_proxychains
        install_sshuttle
        install_pcredz
        install_bloodhound
	install_onedriveuserenum
        install_crackmapexec
        install_netexec
        install_enum4linux
        install_evilwinrm
        install_nessus
	install_donpapi
	finish
	}

setup() {
	sudo mkdir /opt/Pentest
	}

install_go() {
	echo -e "\n $greenplus Adding GO GOPATH to .zshrc"
	sleep 2
	echo 'export GOPATH="$HOME/.go"' >> ~/.zshrc
	echo 'export PATH="$PATH:${GOPATH//://bin:}/bin"' >> ~/.zshrc
	source ~/.zshrc
	mkdir -p ~/.go/{bin,pkg,src}
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_joplin() {
    echo -e "\n $greenplus Installing Joplin \n"
    sleep 2
    wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
    echo -e "\n $greenplus Complete \n"
    sleep 2
    }

install_recon-ng() {
	echo -e "\n $greenplus Installing Recon-NG"
	sleep 2
	cd /opt/Pentest/ && sudo git clone https://github.com/lanmaster53/recon-ng.git && cd recon-ng && pip install -r REQUIREMENTS
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_amass() {
	echo -e "\n $greenplus Installing Amass"
	sleep 2
	go install -v github.com/owasp-amass/amass/v4/...@master
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_subfinder() {
	echo -e "\n $greenplus Installing Subfinder"
	sleep 2
	go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_ffuf() {
	echo -e "\n $greenplus Installing Ffuf"
	sleep 2
	go install github.com/ffuf/ffuf/v2@latest
#	cd /opt/Pentest/ ; sudo git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_nikto() {
	echo -e "\n $greenplus Installing Nikto"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/sullo/nikto
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_shodancli() {
	echo -e "\n $greenplus Installing ShodanCLI"
	sleep 2
	python3 -m pipx install shodan
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_gobuster() {
	echo -e "\n $greenplus Installing GoBuster"
	sleep 2
	go install github.com/OJ/gobuster/v3@latest
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_dirbuster() {
	echo -e "\n $greenplus Installing Disbuster"
	sleep 2
	cd /opt/Pentest ; sudo git clone https://gitlab.com/kalilinux/packages/dirbuster.git ; sudo sed -i 's@DirBuster-1.0-RC1.jar@/opt/dirbuster/DirBuster-1.0-RC1.jar@g' /opt/Pentest/dirbuster/DirBuster-1.0-RC1.sh
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_sqlmap() {
	echo -e "\n $greenplus Installing SQLMap"
	sleep 2
	cd /opt/Pentest && sudo git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_hashcat() {
	echo -e "\n $greenplus Installing Hashcat"
	sleep 2
 	sudo apt install -y ocl-icd-libopencl1 pocl-opencl-icd
	cd /opt/Pentest && sudo git clone https://github.com/hashcat/hashcat && cd hashcat && sudo make && sudo make install
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_hashcat-utils() {
	echo -e "\n $greenplus Installing Hashcat Utils"
	sleep 2
 	cd /opt/Pentest && sudo git clone https://github.com/hashcat/hashcat-utils.git && cd hashcat-utils/src && sudo make && sudo cp *bin ../bin
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_hcxdumptools() {
	echo -e "\n $greenplus Installing HCXDumpTool"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/ZerBea/hcxdumptool && cd hcxdumptool && sudo make && sudo make install
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_hcxtools() {
	echo -e "\n $greenplus Installing HCXTools"
	sleep 2
	sudo apt install -y libcurl4-openssl-dev
 	cd /opt/Pentest && sudo git clone https://github.com/ZerBea/hcxtools.git && cd hcxtools && sudo make && sudo make install
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_bettercap() {
	echo -e "\n $greenplus Installing Bettercap and Bettercap WebUI"
	sleep 2
	sudo apt install -y libnetfilter-queue-dev libusb-1.0-0-dev libpcap-dev
	go install github.com/bettercap/bettercap@latest
	sudo ~/.go/bin/bettercap -eval "caplets.update; ui.update; q"
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_kismet() {
	echo -e "\n $greenplus Installing Kismet"
	sleep 2
	sudo rm -rfv /usr/local/bin/kismet* /usr/local/share/kismet* /usr/local/etc/kismet*
	sudo apt install -y build-essential git libwebsockets-dev pkg-config rtl-433 zlib1g-dev libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libnm-dev libdw-dev libsqlite3-dev libprotobuf-dev libprotobuf-c-dev protobuf-compiler protobuf-c-compiler libsensors4-dev libusb-1.0-0-dev python3 python3-setuptools python3-protobuf python3-requests python3-numpy python3-serial python3-usb python3-dev python3-websockets librtlsdr0 libubertooth-dev libbtbb-dev libmosquitto-dev
	cd /opt/Pentest && sudo git clone https://www.kismetwireless.net/git/kismet.git && cd kismet
	sudo ./configure
	sudo make
	sudo make -j$(nproc)
	sudo make suidinstall
	sudo usermod -aG kismet $USER
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_mdk4() {
	echo -e "\n $greenplus Installing mkd4"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/aircrack-ng/mdk4 && cd mdk4 && sudo make && sudo make install
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_rtl8812au-drivers() {
	echo -e "\n $greenplus Installing RTL8812AU Drivers"
	sleep 2
	cd /opt/Pentest && sudo git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au.git && cd rtl8812au && sudo make && sudo make install
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_seclists() {
	echo -e "\n $greenplus Installing Seclists"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/danielmiessler/SecLists.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_burpsuite() {
	echo -e "\n $greenplus Installing Burpsuite"
	sleep 2
	firefox https://portswigger.net/burp/communitydownload
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_onelist() {
	echo -e "\n $greenplus Installing OneListForThemAll"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/six2dez/OneListForAll.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_onerule() {
	echo -e "\n $greenplus Installing OneRuleToRuleThemAll"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/stealthsploit/Optimised-hashcat-Rule.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_slun() {
	echo -e "\n $greenplus Installing StatisticallyLikelyUsernames"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/stealthsploit/Optimised-hashcat-Rule.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_metasploit() {
	echo -e "\n $greenplus Installing Metasploit"
	sleep 2
	cd /home/$USER/
	curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
	chmod 755 msfinstall && \
	./msfinstall
	rm /home/$USER/msfinstall
	sudo apt-key export 2007B954 | sudo gpg --dearmour -o /opt/keyrings/metasploit.gpg
	sudo echo 'deb [arch=amd64 signed-by=/opt/keyrings/metasploit.gpg] http://downloads.metasploit.com/data/releases/metasploit-framework/apt lucid main' | sudo tee /etc/apt/sources.list.d/metasploit-framework.list > /dev/null
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_peass() {
	echo -e "\n $greenplus Installing PEASS"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/carlospolop/PEASS-ng.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_smbmap() {
	echo -e "\n $greenplus Installing SMBMap"
	sleep 2
	python3 -m pipx install smbmap
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_responder() {
	echo -e "\n $greenplus Installing Responder"
	sleep 2
#	python3 -m pipx install responder
	cd /opt/Pentest && sudo git clone https://github.com/lgandx/Responder.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_impacket() {
	echo -e "\n $greenplus Installing Impacket"
	sleep 2
	python3 -m pipx install impacket
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_hydra() {
	echo -e "\n $greenplus Installing THC-Hydra"
	sleep 2
	cd /opt/ && sudo git clone https://github.com/vanhauser-thc/thc-hydra.git && cd thc-hydra && sudo ./configure && sudo make && sudo make install
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_pcredz() {
	echo -e "\n $greenplus Installing PCredz"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/lgandx/PCredz.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_bloodhound() {
	echo -e "\n $greenplus Installing Bloodhound"
	sleep 2
	sudo apt install -y openjdk-17-jdk apt-transport-https
	wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
	echo 'deb https://debian.neo4j.com stable 4' | sudo tee /etc/apt/sources.list.d/neo4j.list > /dev/null
	sudo apt update
	sudo apt install -y neo4j
	firefox http://localhost:7474/
	sudo /usr/bin/neo4j console
#	firefox https://bloodhound.readthedocs.io/en/latest/installation/linux.html #install-neo4j
	sudo /opt/Pentest && sudo wget https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip && unzip BloodHound-linux-x64.zip && rm BloodHound-linux-x64.zip
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_onedriveuseremum() {
	echo -e "\n $greenplus Installing OneDriveUser Enum"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/nyxgeek/onedrive_user_enum.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	{

install_crackmapexec() {
	echo -e "\n $greenplus Installing CrackMapExec"
	sleep 2
	cd /opt/Pentest && sudo wget https://github.com/byt3bl33d3r/CrackMapExec/releases/download/v5.4.0/cme-ubuntu-latest-3.11.zip && sudo unzip cme-ubuntu-latest-3.11.zip && sudo rm cme-ubuntu-latest-3.11.zip
	sudo mkdir crackmapexec && sudo mv cme crackmapexec/
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_netexec() {
	echo -e "\n $greenplus Installing NetExec"
	sleep 2
	python3 -m pipx install git+https://github.com/Pennyw0rth/NetExec
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_enum4linux() {
	echo -e "\n $greenplus Installing Enum4Linux"
	sleep 2
	cd /opt/Pentest && sudo git clone https://github.com/CiscoCXSecurity/enum4linux.git
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_evilwinrm() {
	echo -e "\n $greenplus Installing EvilWinRM"
	sleep 2
	sudo apt install -y ruby-dev
	sudo gem install evil-winrm
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

install_Nessus() {
	echo -e "\n $greenplus Installing Nessus"
	sleep 2
	nessus_amd64_file=$(curl https://www.tenable.com/downloads/nessus\?loginAttempted\=true | grep -o -m1 -E "Nessus-[0-9]{1,2}.[0-9]{1}.[0-9]{1}-debian10_amd64.deb" | grep -m1 -i ".deb")
	nessus_amd64="https://www.tenable.com/downloads/api/v2/pages/nessus/files/$nessus_amd64_file"
	wget -q $nessus_amd64 -O /tmp/nessus_amd64.deb
	sudo dpkg -i /tmp/nessus_amd64.deb
	rm -f /tmp/nessus_amd64.deb
	echo -e "\n $greenplus Complete \n"
	sleep 5
	}

install_donpapi() {
	echo -e "\n $greenplus Installing DonPAPI"
	sleep 2
	python3 -m pipx install donpapi
	echo -e "\n $greenplus Complete \n"
	sleep 2
	}

finish() {
	clear
	echo -e "\n All finished! Happy Hacking! :) \n"
	}

install
