#!/bin/bash
## SPANISH ##

# WELCOME SCREEN #
zenity --info \
       --title="Bienvenido a Steam Skin Changer para Linux" \
       --text="Steam Skin Changer es un script para sistema Linux para instalar skins (temas) de terceros en Steam.\n\nDesarrollado por Javier Santos, @fjaviersantos.\n\nCódigo fuente disponible en GitHub."
# CHECK IF STEAM IS INSTALLED #
if ! [ -d ~/.local/share/Steam ]; then
	zenity --warning \
	       --title="Houston, tenemos un problema..." \
	       --text="Steam no está instalado. Asegúrate de que Steam está instalado en la carpeta de instalación por defecto."
	exit
fi
# LICENSE AGREEMENT #
zenity --text-info \
       --title="Licencia" \
       --html \
       --url=https://raw.githubusercontent.com/javiersantos/SteamSkinChanger/master/LICENSE \
       --checkbox="He leído y acepto los términos."
case $? in
    1)
        exit
	;;
    -1)
        echo "An unexpected error has occurred. Please try again."
	;;
esac
# METRO FOR STEAM #
if zenity --question \
	      --title="Steam Skin Changer para Linux" \
	      --text="¿Quiéres instalar Metro for Steam? El tema se descargará e instalará."; then
	wget http://files.gamebanana.com/guis/metro_for_steam_-_38_-_beta_7.zip -P /tmp/ 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# Downloading \2/' | zenity --progress --title="Downloading Metro for Steam..."
	mv "/tmp/metro_for_steam_-_38_-_beta_7.zip" "/tmp/metro_for_steam.zip"
	unzip -o "/tmp/metro_for_steam.zip" -d "/tmp/"
	rm -rf ~/.local/share/Steam/skins/Metro\ for\ Steam\/
	mv "/tmp/Metro for Steam/" ~/.local/share/Steam/skins/
else
	exit
fi