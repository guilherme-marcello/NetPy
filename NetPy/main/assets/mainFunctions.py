from os import geteuid
from time import sleep
from sys import version_info
from socket import create_connection
from assets.cores import yellow,green,red,reset,cyan,magenta
from assets.constantes import yes,load

def checkNET(): 
    print(yellow + "[*] A testar conexão da rede...")
    try:
        create_connection(("www.google.com", 80))
        print(green + "[+] Rede encontrada.")
        sleep(0.1)
    except OSError: 
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

def get_IP(option):
    while True:
        if input(cyan+option+' em todos os computadores da rede (submáscara /24: 255.255.255.0)? ').lower() in yes:
            print(load);sleep(0.1);
            host_choice = '192.168.1.0/24';break;
        else:
            if input('Um IP em específico? ') in yes:
                ipp = input('IP escolhido: ')
                print(magenta+'O endereço IP escolhido foi {0}'.format(ipp))
                if input(cyan+'Está correto? ') in yes:
                    print(load);sleep(0.1);
                    host_choice = ipp;break;
                else:
                    print(yellow+'OK...terá outra oportunidade :)')
    return host_choice
