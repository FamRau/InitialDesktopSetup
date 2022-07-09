#!/bin/bash

#--------------------------------------------------------
# Script to archiv /etc/apt/sources.list.d
#--------------------------------------------------------


#--------------- Function -------------------------------
#   Function to archive apt/sources.list.d
# ARGUMENT:
#           None
# OUTPUT:
#           Archiv/apt_archiv.tar   
#-------------------------------------------------------- 
save_apt_archive () {
    # path to files
    file=Archive/apt_archive.tar

    # Check if archive already exists. If yes, delete it.
    if [[ -f "$file" ]]; then
        rm $file
    fi

    # Erstelle archive.tar entsprechen archive_list.txt
    tar cfv Archive/apt_archive.tar /etc/apt/sources.list.d/
}



# Befehl tar cvfpa archiv2.tar -T list.txt
# Append file/folder to archiv
# tar --append --file=archive.tar test