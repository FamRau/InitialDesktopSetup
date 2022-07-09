#!/bin/bash

########## Initial Desktop Setup ########################
# Script to setup a new computer environment
# by Gerhard Rauniak
# Juli 2022
# 
# README.md https://github.com/FamRau/InitialDesktopSetup
#########################################################


. installFiles.sh
. getArchive.sh
. addArchive.sh

show_menu(){
    #color definitions
    normal=`echo "\033[m"` #black
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[00;31m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`

    #printf menu
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Copy files to Archive ${normal}\n"
    printf "${menu}**${number} 2)${menu} Get files from Archive ${normal}\n"
    printf "${menu}**${number} 3)${menu} Install programs ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}q to exit. ${normal}"
    read option
}

option_picked(){
    msgcolor=`echo "\033[01;32m"` # bold green
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $option != '' ]
    do
    if [ $option = '' ]; then
      exit;
    else
      case $option in
        1) clear;
            option_picked "Copy files to archive"
            # TODO: add function files to archive
            show_menu;
        ;;
        2) clear;
            option_picked "Copy files from archive";
            # TODO: add function files from archive
            show_menu;
        ;;
        3) clear;
            option_picked "Install programs"
            read_progfile "$prog2install"
            show_menu;
        ;;
        [qQ])exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done