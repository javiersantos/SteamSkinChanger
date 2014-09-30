#!/bin/bash
NAME=STEAM_SKIN_CHANGER_FOR_UBUNTU
VERSION=20140930

# MAIN SCREEN, LENGUAGE SELECTION
# CHOOSE LANGUAGE AND OPEN SH SCRIPT
language=$(zenity --list --title="Choose your language" --text="Please select the language to use for the interface.\nPor favor, seleccione el idioma deseo para la interfaz.\n"  --column="Language" "English" "Español")

if [ $language = "English|English" ]; then
	./EN/en.sh
	#echo "English"
fi
if [ $language = "Español|Español" ]; then
	./ES/es.sh
	#echo "Español"
fi