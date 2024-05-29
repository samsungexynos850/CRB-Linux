#!/bin/bash

# Very first thing is to check this script is being run from
# the correct directory. If not, then exit the script.
if [ -e ./tools/checker ]; then
    :
else
    echo "[Error 1] You are not in the correct directory!"
    echo "Stopping program now!"
    exit 0
fi

# Then we update the source if needed
echo "Updating source if required..."
git fetch && git pull > /dev/null 2>&1

# Add formatting to the script
BLACK='\033[0;30m'
BOLD_BLACK='\033[1;30m'
RED='\033[0;31m'
BOLD_RED='\033[1;31m'
GREEN='\033[0;32m'
BOLD_GREEN='\033[1;32m'
YELLOW='\033[0;33m'
BOLD_YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD_BLUE='\033[1;34m'
MAGENTA='\033[0;35m'
BOLD_MAGENTA='\033[1;35m'
CYAN='\033[0;36m'
BOLD_CYAN='\033[1;36m'
WHITE='\033[0;37m'
BOLD_WHITE='\033[1;37m'
RESET='\033[0m' # Reset color
BOLD='\033[1m'
PINK='\033[38;5;206m'
UNDERLINE='\033[4m'

PROJECT()
{
CURRENT_PROJECT=$(cat tools/project)
if [ ! -s "tools/project" ]; then
	CURRENT_PROJECT="None"
fi
export PROJECT=$CURRENT_PROJECT
}

CHECK_PROJECT_EXISTS()
{

if [ ! -s "tools/project" ]; then
	echo ""
	echo "[Error 1] No project selected!"
	echo "exiting..."
	exit 0
fi

}

# Print the menu
PRINT()
{
	echo -e "                                                 ${BOLD_BLUE}${UNDERLINE}Welcome To CRB-Linux Kitchen - By RiskyGUY22${RESET}${RESET}"
	echo -e "${BOLD_RED}**PROJECT MANAGEMENT**${RESET}                                    ${BOLD}${PINK}${UNDERLINE}Selected Project: $CURRENT_PROJECT${RESET}${RESET}${RESET}"
	echo -e "1)  New Project"
	echo -e "2)  Select Project"
	echo -e "3)  Delete Projects"
	echo -e ""

	echo -e "${BOLD_GREEN}**UNPACK IMAGE**${RESET}"
	echo -e "4)  Unpack super.img"
	echo -e "5)  Unpack prism.img"
	echo -e "6)  Unpack optics.img"
	echo -e "7)  Unpack boot.img"
	echo -e ""

	echo -e "${BOLD_YELLOW}**REPACK IMAGE**${RESET}"
    echo -e "8)  Repack super.img"
    echo -e "9)  Repack boot.img"
	echo -e "10) Package ROM"
	echo -e ""

	echo -e "${BOLD_MAGENTA}**MISC**${RESET}"
	echo -e "11) Disable vbmeta"
	echo -e "12) Debloater Tool"
    echo -e "13) Exit this menu"
	echo -e ""
}

MAIN()
{
	# Set the option to 0
	option=0
	# Loop until the user exits
	while [ "$option" -ne 14  ]; do
		PROJECT
		PRINT

		read -p "OPTION: " option

		case $option in
			1)
				bash scripts/new_project.sh
				;;
			2)
				bash scripts/select_project.sh
				;;
			3)
				CHECK_PROJECT_EXISTS
				bash scripts/cleanup.sh
				;;
			4)
				CHECK_PROJECT_EXISTS
				bash scripts/unpack_super.sh
				;;
			5)
				CHECK_PROJECT_EXISTS
				bash scripts/unpack_prism.sh
				;;
			6)
				CHECK_PROJECT_EXISTS
				bash scripts/unpack_optics.sh
				;;
			7)
				CHECK_PROJECT_EXISTS
				bash scripts/unpack_boot.sh
				;;
			8)
				CHECK_PROJECT_EXISTS
				bash scripts/repack_super.sh
				;;
			9)
				CHECK_PROJECT_EXISTS
				bash scripts/repack_boot.sh
				;;
			10)
				CHECK_PROJECT_EXISTS
				bash scripts/package_rom.sh
				;;
			11)
				CHECK_PROJECT_EXISTS
				bash scripts/disable_vbmeta.sh
				;;
			12)
				CHECK_PROJECT_EXISTS
				bash scripts/debloat_tool.sh
				;;
			13)
				echo "Exiting..."
				exit 0
				;;
			*)
				echo "[Error 1] Invalid option!"
				;;

		esac
	done
}

# Call all of the code above
MAIN
