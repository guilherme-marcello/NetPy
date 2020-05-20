from assets.cores import red
from assets.mainFunctions import *
from time import sleep
        
def main():
    checkSU();checkPY();checkNET();
    print(red+' [!!] Essa opção não está desenvolvida ainda. :(');sleep(2); 
try:
    if __name__ == '__main__':
        main()
except KeyboardInterrupt:
    print("\n")
    print(red + "[!] KeyboardInterrupt Detetado")
    print(red + "[!] RIP" + reset)
    exit(0)
