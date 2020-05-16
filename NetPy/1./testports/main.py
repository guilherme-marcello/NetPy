import nmap,os,socket,sys
from time import sleep
from assets.cores import red,reset,green,cyan,yellow,magenta,blue,white,blink
from assets.constantes import yes,load
from assets.func import checkSU,checkPY,checkNET,PingScan
        
def main():
    checkSU();checkPY();checkNET();
    while True:
        if input(cyan+'Varredura em todos os computadores da rede (submáscara /24: 255.255.255.0)? ').lower() in yes:
            print(load);sleep(2);
            host_choice = '192.168.1.0/24';break;
        else:
            if input('Um IP em específico? ') in yes:
                ipp = input('IP escolhido: ')
                print(magenta+'O endereço IP escolhido foi {0}'.format(ipp))
                if input(cyan+'Está correto? ') in yes:
                    print(load);sleep(2);
                    host_choice = ipp;break;
                else:
                    print(yellow+'OK...terá outra oportunidade :)')
    PingScan(host_choice)

try:
    if __name__ == '__main__':
        main()
except KeyboardInterrupt:
    print("\n")
    print(red + "[!] KeyboardInterrupt Detetado")
    print(red + "[!] RIP" + reset)
    exit(0)

'''
n = nmap.PortScanner()
n.scan(hosts='192.168.1.0/24',arguments='-sn')
print(n.command_line())
#print(n.all_hosts())
#for host in n.all_hosts():
   # print('\n')
   # print(host)
   # print('Host: {0} ({1})'.format(host,n[host].hostname()))
   # print('Estado: {0}'.format(n[host].state()))
'''
