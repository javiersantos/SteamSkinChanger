#!/bin/bash
## ENGLISH ##

# WELCOME SCREEN #
zenity --info \
       --title="Welcome to Steam Skin Changer for Linux" \
       --text="Steam Skin Changer for Linux is a script for Linux systems to install third-party skins for Steam.\n\nDeveloped by Javier Santos, @fjaviersantos.\n\nSource code available on GitHub."
# CHECK IF STEAM IS INSTALLED #
if ! [ -d ~/.local/share/Steam ]; then
	zenity --warning \
	       --title="Houston, we have a problem..." \
	       --text="Steam is not installed on your Linux. Make sure Steam is installed in the default installation path."
	exit
fi
# LICENSE AGREEMENT #
zenity --text-info \
       --title="License" \
       --html \
       --url=https://raw.githubusercontent.com/javiersantos/SteamSkinChanger/master/LICENSE \
       --checkbox="I read and accept the terms."
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
	      --title="Steam Skin Changer for Linux" \
	      --text="Do you want to install Metro for Steam Theme? Theme will be downloaded and installed."; then
	wget http://files.gamebanana.com/guis/metro_for_steam_-_38_-_beta_7.zip -P /tmp/ 2>&1 | sed -u 's/.*\ \([0-9]\+%\)\ \+\([0-9.]\+\ [KMB\/s]\+\)$/\1\n# Downloading \2/' | zenity --progress --title="Downloading Metro for Steam..."
	mv "/tmp/metro_for_steam_-_38_-_beta_7.zip" "/tmp/metro_for_steam.zip"
	unzip -o "/tmp/metro_for_steam.zip" -d "/tmp/"
	rm -rf ~/.local/share/Steam/skins/Metro\ for\ Steam\/
	mv "/tmp/Metro for Steam/" ~/.local/share/Steam/skins/
else
	exit
fi