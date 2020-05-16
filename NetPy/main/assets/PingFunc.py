import nmap
import pandas as pd
from assets.cores import yellow,green,magenta,cyan
from os import getcwd
from time import strftime as stime
from assets.constantes import yes

def get_HostScanData(nmapOBJECT,h):
    return [h, nmapOBJECT[h].hostname(),nmapOBJECT[h].state()]

def PingScan(h):
    portScan = nmap.PortScanner();portScan.scan(hosts=h,arguments='-sn');
    EstadoHOST = pd.DataFrame(columns=['Host','Hostname','Estado'])
    for host,index in zip(portScan.all_hosts(),[i for i in range(len(portScan.all_hosts()))]):
        EstadoHOST.loc[index] = get_HostScanData(portScan,host)
        print(yellow+'[*] A inserir {0} no DataFrame...'.format(host))
    print(green+'[+] DataFrame pronto.')
    print(magenta,EstadoHOST);print('\n')
    if input(cyan+'Deseja gravar o DataFrame como ficheiro csv? (será gravado em {0}/OUTPUT) '.format(getcwd())) in yes:
        now = stime("%Y,%m,%d,%H,%M,%S");t = now.split(',')
        EstadoHOST.to_csv('OUTPUT/pingDF'+'_'.join(t)+'.csv')
