#!/bin/bash
# Project name : CHID - Cert.ir Host IP Discover
# Written by : KsrvcO
# Tested on : Linux Operation Systems
# Contact : flower.k2000[at]gmail.com
# Explain :
#   Cert.ir or Certcc.ir is using ArvanCloud Cloud platform for hiding real ip address
#   for prevent DOS/DDOS attacks on cert website. This tool can bypass this feature and get cert real ip address.
# Video demo : https://www.youtube.com/watch?v=46h0741r5w0
reset
banner(){
echo -e "

   oooooooo8 ooooo ooooo ooooo ooooooooo   
 o888     88  888   888   888   888    88o 
 888          888ooo888   888   888    888 
 888o     oo  888   888   888   888    888 
  888oooo88  o888o o888o o888o o888ooo88   
                                    by KsrvcO       
 
 [+] Project name : CHID - Cert.ir Host IP Discover
 [+] Written by : KsrvcO
 [+] Tested on : Linux Operation Systems
 [+] Contact me : flower.k2000[at]gmail.com

"
}
banner
sleep 3
read -p " Enter Host address (cert.ir) : " hostaddr
clear
banner
echo "========================"
echo "    Found Subdomains"
echo "========================"
echo ""
while read HOST; do host $HOST.$hostaddr | grep -v "not found"; done < sublist.txt
echo ""
sleep 10
clear
banner
read -p " [+] Enter found host address (ex: 140.140.140. ) : " foundedhost
echo ""
echo "==============================================="
echo ""
for i in {130..142}
do
(echo >/dev/tcp/"$foundedhost$i"/80) &>/dev/null && echo " [-] Host $foundedhost$i have Open port 80/tcp"
done
echo ""
echo ""
exit