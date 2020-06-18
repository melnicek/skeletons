#!/bin/bash

if [ $# -ne 2 ]
then
        echo "Usage: $0 <number-name> <ip>"
        exit 1
fi

mkdir $1
cd $1
mkdir www loot info recon
echo $2 > ip
tmux new -s htb -d
tmux send-keys -t htb:0 'openvpn /root/vpn/yelenz.ovpn' ENTER
tmux new-window
tmux send-keys -t htb:1 'sleep 3; nmap -sC -sV -v -o recon/nmap `cat ip`; nmap -p- -sV -sC -v -o recon/nmap-full `cat ip`' ENTER
tmux attach -t htb
