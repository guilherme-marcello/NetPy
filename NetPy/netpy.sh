#!/bin/sh

red=`echo "\033[91;1m"`
green=`echo "\033[92;1m"`
cyan=`echo "\033[96;1m"`
yellow=`echo "\033[93;1m"`
magenta=`echo "\033[95;1m"`
blue=`echo "\033[94;1m"`
blue_menu=`echo "\033[36m"`
white=`echo "\033[97;1m"`
blink=`echo "\033[5m"`
normal=`echo "\033[m"`
menu=`echo "\033[36m"` #Blue
number=`echo "\033[33m"` #yellow
bgred=`echo "\033[41m"`
fgred=`echo "\033[31m"`
msgcolor=`echo "\033[01;31m"` # bold red
normal2=`echo "\033[00;00m"` # normal white
look_for_help="Utilize o comando 'show options' para visualizar as opções ou acesse a lista de comandos com 'help'. "

option_picked(){
    message=${@:-"${normal2}Error: Algo de errado aconteceu. Contacte um desenvolvedor"}
    printf "${msgcolor}${message}${normal2}\n"
}

enter_request(){
    while [ $ppp!='' ]
      do
        read -p "${green} [X] Pressione ENTER para $1." ppp
        if [ -z "$ppp" ]; then
          break
        fi
      done
}

show(){
$1
}


banner(){
    echo " _   _        _   ______       ";
    echo "| \ | |      | |  | ___ \      ";
    echo "|  \| |  ___ | |_ | |_/ /_   _ ";
    echo "| . \` | / _ \| __||  __/| | | |";
    echo "| |\  ||  __/| |_ | |   | |_| |";
    echo "\_| \_/ \___| \__|\_|    \__, |";
    echo "                          __/ |";
    echo "                         |___/ ";
    echo "\n                    developer: Guilherme Marcello";
}


main_menu(){
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Check ${normal}\n"
    printf "${menu}**${number} 2)${menu} Scan ${normal}\n"
    printf "${menu}**${number} 99)${menu} Sair ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Escolha uma opção. ${normal}\n"

}

scan_menu(){
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Ping Scan ${normal}\n"
    printf "${menu}**${number} 99)${menu} Voltar para o menu principal ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Escolha uma opção. ${normal}\n"

}

help_menu(){
    printf "${cyan} \033[4m HELP "
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 'run'|'-r')${menu} Executar módulo ${normal}\n"
    printf "${menu}**${number} 'clear'|'-c'|'limpar')${menu} Limpar ${normal}\n"
    printf "${menu}**${number} 'help'|'-h'|'ajuda')${menu} Ajuda ${normal}\n"
    printf "${menu}**${number} 'show options'|'options')${menu} Exibir as opções ${normal}\n"
    printf "${menu}**${number} 'use')${menu} Selecionar módulo ${normal}\n"
    printf "${menu}**${number} 'back'|'voltar'|'reset')${menu} Voltar ao início ${normal}\n"
    printf "${menu}**${number} 'exit'|'exit()'|'sair'|'-s')${menu} Sair do programa ${normal}\n"
    printf "${menu}*********************************************${normal}\n\n"
    enter_request "sair do menu de ajuda"
}


# 1- opcao 1
# 2- opcao 2
# 3- opcao 3
# 4- opcao 4
# 5- netpy(caminho)
# 6- menu com as opcoes
# 7- comando run
# 8- choice
openTerminal(){
read -p "${white}netpy(${blue_menu}$5${white}) >> " choice
      case $choice in
        "clear"|"-c"|"limpar") clear;
        ;;
        "help"|"-h"|"ajuda") show help_menu; 
        ;;
        "show options"|"options") show $6; continue;
        ;;
        "back"|"voltar"|"reset") echo "${yellow} [*] A retornar ao início..."; sleep 1.2; break;
        ;;
        1|'use 1') $1 
        ;;
        2|'use 2') $2
        ;;
        3|'use 3') $3
        ;;
        4|'use 4') $4
        ;;
        'run'|'-r'|'exec') $7
        ;;
        99|'exit'|'sair'|'-s'|'use 99') option_picked "[!] O programa será encerrado.";
		exit;
        ;;
        '') continue
        ;;
        *)clear;
            option_picked $look_for_help; enter_request "continuar"
        ;;
      esac
}

nothing(){ clear; option_picked $look_for_help;}

mainMenu1(){ clear;option_picked "Check";printf "A carregar...\n";python3 main/1_main.py; echo "${yellow} [*] A retornar ao início..."; sleep 1.2; break;} 


runPingScan(){
python3 main/2_scan1.py
}

no_options(){
echo "${green}[!!] Não há opções, o modúlo já foi selecionado. Pode voltar ao início com o comando 'back' ou executar o módulo com 'run'."
}

scan_ping(){
echo "${green}[+] Módulo selecionado com sucesso. \n${yellow}[!] Utilize o comando 'run' para executar o módulo ou ENTER para retornar ao início."
openTerminal nothing nothing nothing nothing scan/ping no_options runPingScan 
}

mainMenu2(){ clear;option_picked "Scan"; show scan_menu; openTerminal scan_ping nothing nothing nothing scan scan_menu nothing} 

}

main(){
show banner	
while [ "$choice"!='' ]
    do
         openTerminal mainMenu1 mainMenu2 nothing nothing / main_menu nothing
    done 
}


main
