
#! /usr/bin/bash

########## Initial Desktop Setup ########################
# Script to setup a new computer
# by Gerhard Rauniak
# Juli 2022
# 
# README.md https://github.com/FamRau/InitialDesktopSetup
#########################################################


# color definitions
green="\033[0;32m"
red="\033[0;31m"
blank="\033[0m"

# Textfile with programs to install 
prog2install="./prog2install.txt"


#### FUNCTION check_file BEGIN
# Checks if program is installed. If not, user is asked wether to install it or not
# ARGUMENT:
#       It uses the output of "IFS= read -r -u3 line" in the function read_progfile
# OUTPUT:
#       Install the program if it's not installed  
### FUNCTION END
check_file (){
    if ! command -v $1 &> /dev/null # check if programm is callable. It not, it's not installed.
    then                            # if it's not installed, ask user if ith should be installed.
        echo -e "$red*** $1 ***$blank could not be found. Would yo install it? (Y/N)"
        read answer
    while [[ "$answer" != "y" ]] && [[ "$answer" != "n" ]] #check if user input is y or no 
        do
            echo "Only y or n!"
            read answer
        done

        if [[ "$answer" == "y" ]]
        then
            apt install $1  
            echo -e "$green*** $1 ***$blank successfully installed"
        fi   

    else                            #if it's already installed, inform user
        echo -e "$green*** $1 ***$blank is already installed."
    fi
}


#### FUNCTION read_progile BEGIN
#   Function to read prog2install line by line and use it as argument for the check_file function
# ARGUMENT
#   variable prog2install which directs to prog2install.txt with all programms to be installed
# OUTPUT:
#       Runs check_file function      
### FUNCTION END
read_progfile () {
    while IFS= read -r -u3 line     # reads the file line by line
    do
        check_file "$line"
    done 3< "$1"
}


# calls check_file function
read_progfile "$prog2install"