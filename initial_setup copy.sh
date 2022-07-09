#! /usr/bin/bash

set -x
set -v
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
prog_file="./prog_to_install.txt"

#### FUNCTION BEGIN
# Checks if program is installed
# If not, user is asked wether to install it or not
# ARGUMENT:
#       Name of the program to be checked
# OUTPUT:
#       Install the program if it's not installed
#       It installed, end the script.        
### FUNCTION END
check_file () {
if ! command -v $1 &> /dev/null 
then
    echo -e "$red*** $1 ***$blank could not be found. Do you want to install it y/n?"
    read answer 
    while [ "$answer" != "y" ] && [ "$answer" != "n" ] #check if user input is y or no 
    do
        echo "Only y or n!"
        read answer
    done

    if [ $answer == "y" ]
    then
        apt install $1  
        echo -e "$green*** $1 ***$blank successfully installed"
    fi

else
    echo -e "$green*** $1 ***$blank is already installed."
fi
}


#### FUNCTION BEGIN
# Function to read programs prog_to_install.txt and use 
# it as argument for check_file function
# ARGUMENT:
#       Name of the text file with prog to install
# OUTPUT:
#       Runs check_file function with programs as argument        
### FUNCTION EN
read_progfile () {
    while IFS= read -r line
    do
        check_file "$line"
    done < "$1"
}


# calls check_file function
#check_file "cromic" # cronic is only used for testing

read_progfile "$prog_file"

