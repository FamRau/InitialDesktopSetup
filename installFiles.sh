#! /usr/bin/bash

########## install files ########################
# Script check if prgrams are installed and install them 
#########################################################


# color definitions
filename="\033[0;32m"
failure="\033[0;31m"
normal="\033[0m"

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
        printf "$failure*** $1 ***$normal could not be found. Would yo install it? (Y/N)"
        read answer
    while [[ "$answer" != "y" ]] && [[ "$answer" != "n" ]] #check if user input is y or no 
        do
            printf "Only y or n!"
            read answer
        done

        if [[ "$answer" == "y" ]]
        then
            apt install $1  
            printf "$filename*** $1 ***$normal successfully installed"
        fi   

    else                            #if it's already installed, inform user
        printf "$filename*** $1 ***$normal is already installed.\\n"
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
#read_progfile "$prog2install"