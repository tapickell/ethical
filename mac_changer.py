#!/usr/bin/env python

import random
import subprocess

eth = 'enp0s25'
original_mac = '68:f7:28:42:73:28'

def append_seperator(char, x, max):
    if x == max or x % 2 == 0:
        return char
    else:
        return ''.join([char, ':'])

def random_mac():
    max = 12
    hex_chars = '0123456789abcdef'
    rand_hex = lambda: random.choice(hex_chars)
    apply_append = lambda x: append_seperator(rand_hex(), x, max - 1)
    mac_list = [apply_append(x) for x in range(max)]
    return ''.join(mac_list)

def change_mac(interface, mac):
    print("Changing MAC address for " + interface + " to " + mac)
    subprocess.call("ifconfig " + interface + " down", shell=True)
    subprocess.call("sudo ifconfig " + interface + " hw ether " + mac, shell=True)
    subprocess.call("ifconfig " + interface + " up", shell=True)

def check_mac(interface):
    subprocess.call(["ifconfig", interface])

print("Starting mac changer")
# check_mac(eth)
# print("Original Mac")
change_mac(eth, random_mac())
# check_mac(eth)
# print("Ramdom Mac")
# change_mac(eth, original_mac)
# check_mac(eth)
# print("Original Mac")
# print(random_mac())