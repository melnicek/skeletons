#!/usr/bin/env python3

import socket

HOST = '127.0.0.1'
PORT = 0

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    
    s.sendall(b'hello world')
    
    data = s.recv(1024)
    print(repr(data))
    
    s.sendall(b'hello world')
    
    data = s.recv(1024)
    print(repr(data))
