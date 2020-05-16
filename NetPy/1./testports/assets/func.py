import nmap
from os import geteuid
from time import sleep
from sys import version_info
from socket import create_connection
from assets.cores import red,reset,green,cyan,yellow,magenta,blue,white,blink
import pandas as pd
import numpy as np

def checkNET(): # Checks for internet connection #
    print(yellow + "[*] A testar conexão da rede...")
    try:
        create_connection(("www.google.com", 80))
        print(green + "[+] Rede encontrada.")
        sleep(2)
    except OSError: # Checks for OSError #
        print(red + "[!] Rede não encontrada." + reset)
        exit(0)

def checkPY():
    print(yellow + "[*] A verificar a versão do python instalada...")
    if version_info < (2,0,0):
        exit(red+"[!] A versão do python instalada precisa ser > 2.0.0 ."+reset)
    else:
        print(green + "[+] Versão compatível com o programa.")

def checkSU():
    print(yellow + "[*] A verificar privilégios de superuser...")
    if geteuid() != 0:     
        exit(red + "[!] O programa precisa ser iniciado pelo root." + reset)
    else:
        print(green+"[+] Privilégio válido.")

def get_HostScanData(nmapOBJECT,h):
    return {'Host': [h], 'Hostname':[nmapOBJECT[h].hostname()],'Estado':[nmapOBJECT[h].state()]}


def PingScan(h):
    portScan = nmap.PortScanner();portScan.scan(hosts=h,arguments='-sn');
    print(portScan.all_hosts())
    for host,index in zip(portScan.all_hosts(),[i for i in range(len(portScan.all_hosts()))]):
        if index == 0:
            print("OKKKKKK")
            EstadoHOST = pd.DataFrame(data=get_HostScanData(portScan,host))
        else:
            EstadoHOST.append(get_HostScanData(portScan,host),ignore_index=True)
            #print("Not first")
        print(EstadoHOST)



