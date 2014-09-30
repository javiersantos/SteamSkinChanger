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
# CHECK IF .FONTS FOLDER IS CREATED #
if ! [ -d ~/.Fonts ]; then
	mkdir ~/.Fonts/
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
        echo "Ha ocurrido un error desconocido. Por favor inténtalo de nuevo."
	;;
esac
# METRO FOR STEAM #
if zenity --question \
	      --title="Steam Skin Changer para Linux" \
	      --text="¿Quiéres instalar Metro for Steam? El tema se descargará e instalará."; then
	wget http://files.gamebanana.com/guis/metro_for_steam_-_38_-_beta_7.zip -P /tmp/ 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# Descargando \2/' | zenity --progress --title="Descargando Metro for Steam..."
	mv "/tmp/metro_for_steam_-_38_-_beta_7.zip" "/tmp/metro_for_steam.zip"
	unzip -o "/tmp/metro_for_steam.zip" -d "/tmp/"
	rm -rf ~/.local/share/Steam/skins/Metro\ for\ Steam\/
	mv "/tmp/Metro for Steam/" ~/.local/share/Steam/skins/
	mv "/tmp/INSTALL THIS FONT (WINDOWS 7 AND OLDER)/segoeuisl.ttf" ~/.Fonts/
fi
# PIXELVISION #
if zenity --question \
	      --title="Steam Skin Changer para Linux" \
	      --text="¿Quiéres instalar PixelVision? El tema se descargará e instalará."; then
	wget http://files.gamebanana.com/guis/pixelvision_2014-0925.zip -P /tmp/ 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# Descargando \2/' | zenity --progress --title="Descargando PixelVision..."
	mv "/tmp/pixelvision_2014-0925.zip" "/tmp/pixelvision.zip"
	unzip -o "/tmp/pixelvision.zip" -d "/tmp/"
	rm -rf ~/.local/share/Steam/skins/PixelVision/
	mv "/tmp/Full Installation/PixelVision" ~/.local/share/Steam/skins/
	mv "/tmp/Full Installation/Fonts/SegoeWP.ttf" ~/.Fonts/
	mv "/tmp/Full Installation/Fonts/SegoeWP-Semibold.ttf" ~/.Fonts/
else
	exit
fi