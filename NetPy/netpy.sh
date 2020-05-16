#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Varrimento de portas na rede ${normal}\n"
    printf "${menu}**${number} 99)${menu} Sair ${normal}\n"
#    printf "${menu}**${number} 3)${menu} Restart Apache ${normal}\n"
#    printf "${menu}**${number} 4)${menu} ssh Frost TomCat Server ${normal}\n"
#    printf "${menu}**${number} 5)${menu} Some other commands${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Escolha um opção. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: Algo de errado aconteceu. Contacte um desenvolvedor"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
      case $opt in
        1) clear;
            option_picked "Varrimento de portas na rede";
            printf "A carregar...\n";
	    python3 main/1.py;
	    break;
           
        ;;
        99) option_picked "[!] O programa está a ser encerrado.";
		exit;
        ;;
        *)clear;
            option_picked "Se há um menu, as únicas opções são as que lá estão, oh";
            show_menu;
        ;;
      esac
  done 
