from assets.cores import red,reset,green,cyan,yellow,magenta,blue,white,blink
from assets.constantes import yes,load
from assets.mainFunctions import checkSU,checkPY,checkNET,get_IP;
from assets.PingFunc import PingScan
        
def main():
    checkSU();checkPY();checkNET();
    PingScan(get_IP('Ping'))
try:
    if __name__ == '__main__':
        main()
except KeyboardInterrupt:
    print("\n")
    print(red + "[!] KeyboardInterrupt Detetado")
    print(red + "[!] RIP" + reset)
    exit(0)
