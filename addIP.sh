# Add a new ip to the firewall across all the servers
# Assumes ansible is configured with appropriate group names ; names and port numbers need to be specified in exec function.
# Call exec with new ip at the end.
# Author: MuzammilM

read -srp"Enter prestaging password: " pstgPass
read -srp"Enter staging password: " stgPass
read -srp"Enter production password: " prodPass

function ansibleCMD(){
        echo "allow from "$1" to port "$2" for servers "$3
        ansible -m shell -a "ufw allow from \"$1\" to any port \"$2\"" $3 --become --extra-vars "ansible_sudo_pass="$4
}

function loopServers(){
        for i in {1..3}
        do
                case "$i" in
                   "1") ansibleCMD $1 $2 $3 $pstgPass
                ;;
                   "2") ansibleCMD $1 $2 $3 $stgPass
                ;;
                   "3") ansibleCMD $1 $2 $3 $prodPass
                ;;
                esac
        done
}

function exec() {
loopServers $1 9042 cassandra
loopServers $1 20171 mongo
loopServers $1 6379 redis
}
# Example IP addresses.
exec 1.22.3.4
exec 0.1.9.1
