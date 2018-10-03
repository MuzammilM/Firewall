NMAP

`sudo nmap -f <attack ip>`
* Basic nmap command

`sudo nmp --mtu 8 <attack ip> `
* Send smaller packets of 8 bytes to help prevent detection

`sudo nmap -D RND:10 <attack ip>`
* -D = decoy from 10 different ips to help prevent detection of attacker

`sudo nmap -D decoyip1,decoyip2:10 <attack ip>`
* The decoys to be used

`sudo nmap -sI zombieip attackip`
* Idle zombie scan
* Uses an idle zombie system to scan the attack system
* Gives a list of packets that are being transferred.

`sudo nmap --source-port 54 <attackip>`
* Uses port 54 for the system.

`sudo nmap --data-length 25 attackip`
* Random data to packet
* size is in bytes

`sudo nmap --randomize-hosts 10.72.31.100-175`
* Randomize target scan order

`sudo nmap -sT -PN --spoof-mac 0 attackip`
* 0 tells nmap to generate a random mac address.

`sudo nmap --badsum attackip`
* if it returns the basic info then system is correctly configured.
* sends a bad checksum .
		
