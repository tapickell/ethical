import scapy.all

def scan(ip):
    scapy.all.arping(ip)

scan("10.0.1.25")