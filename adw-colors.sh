#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-only

# Easy maintenance stuff
owner="AtiusAmy"
repo="AdwaitaColors"
version="1.0"

checkForDeps() {
	if ! command wget --help &> /dev/null; then
		echo "wget is not installed, please install it"
		exit
	fi
	
	if ! command unzip --help &> /dev/null; then
		echo "unzip is not installed, please install it"
		exit
	fi
}

installColor() {
	location="${HOME}/.local/share/icons/"
	color=$1
	wget -N -P "${location}" "https://github.com/${owner}/${repo}/releases/download/1.0/Adwaita-${color}.zip"
	unzip -o "${location}Adwaita-${color}.zip" -d "${location}"
	rm "${location}Adwaita-${color}.zip"
	sleep 0.5s
	gsettings set org.gnome.desktop.interface icon-theme Adwaita-${color}
}

colorChoise() {
	echo "Select the color you would like to apply."
	echo "Available options are:"
	echo "  [1] Red"
	echo "  [2] Orange"
	echo "  [3] Yellow"
	echo "  [4] Green"
	echo "  [5] Magenta"
	echo "  [6] Purple"
	echo "  [7] Brown"
	echo "  [8] Gray"
	echo "  [0] Quit"
	echo -n "Enter the number of the color you wish to apply: "
	
	while true; do
		read -r answer
		case $answer in
			0)
				exit
				;;
			1)
				installColor red
				break
				;;
			2)
				installColor orange
				break
				;;
			3)
				installColor yellow
				break
				;;
			4)
				installColor green
				break
				;;
			5)
				installColor magenta
				break
				;;
			6)
				installColor purple
				break
				;;
			7)
				installColor brown
				break
				;;
			8)
				installColor gray
				break
				;;
			*)
				echo -n "Enter the number of the color you wish to apply: "
				;;
		esac
	done
	
}

checkForDeps
colorChoise
