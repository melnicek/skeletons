#!/bin/bash

if [ $# -e 1 ]
then
        cd $1
        tmux new -s htb -d
        tmux send-keys -t htb:0 'openvpn /root/vpn/yelenz.ovpn' ENTER
        tmux new-window
        tmux send-keys -t htb:1 'ping -c 4 `cat ip`' ENTER
        tmux attach -t htb
elif [ $# -e 2 ]
then
        mkdir $1
        cd $1
        mkdir www loot info recon
        echo $2 > ip
        tmux new -s htb -d
        tmux send-keys -t htb:0 'openvpn /root/vpn/yelenz.ovpn' ENTER
        tmux new-window
        tmux send-keys -t htb:1 'sleep 3; nmap -sC -sV -v -o recon/nmap `cat ip`; nmap -p- -sV -sC -v -o recon/nmap-full `cat ip`' ENTER
        tmux attach -t htb
else
        echo "Usage:"
        echo "\t create: $0 <number-name> <ip>"
        echo "\t continue: $0 <number-name>"
        exit 1
fi
