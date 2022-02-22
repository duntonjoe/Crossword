#   TITLE:      grabPuz.sh
#   AUTHOR:     Joseph Dunton
#   SUMMARY:    Script to pull one or more .puz files for daily crosswords.


#!/bin/bash
 
pull_Puz() {
    
    case $2 in

        1)  wget "https://herbach.dnsalias.com/wsj/wsj$1.puz" -O $PuzzDir/Wall_Street_Journal_$1.puz
            cursewords $PuzzDir/Wall_Street_Journal_$1.puz 
            ;;
        2)
            wget "https://herbach.dnsalias.com/uc/uc$1.puz" -O $PuzzDir/Univeral_Daily_Crossword_$1.puz
            cursewords $PuzzDir/Univeral_Daily_Crossword_$1.puz 
            ;;
    esac
}

grabPuz() {
    # Set Colors:
    GREEN='\033[0;32m'
    RED='\033[1;31m'
    NC='\033[0m'

    # Set PuzzDir:
    PuzzDir="$HOME/crosswords"
    
    # Check for puzzle dir:
    [ ! -d $PuzzDir ] && mkdir "$Puzzdir"

    # Generate date stamp for WSJ/UDC file name:
    DAY=$(date +"%D %T" | cut -d "/" -f 1)
    MONTH=$(date +"%D %T" | cut -d "/" -f 2)
    YEAR=$(date +"%D %T" | cut -d "/" -f 3 | cut -d " " -f 1)
    STAMP=$MONTH$DAY$YEAR
   
    # Parameters for ncurses menu
    HEIGHT=15
    WIDTH=40
    CHOICE_HEIGHT=3
    TITLE="GrabPuz"
    MENU="Choose Puzzle(s) to Grab: "

    OPTIONS=(1 "Wall Street Journal"
             2 "Universal Daily Crossword")

    CHOICE=$(dialog --clear \
        --title "$TITLE" \
        --menu "$MENU" \
        $HEIGHT $WIDTH $CHOICE_HEIGHT \
        "${OPTIONS[@]}" \
        2>&1 >/dev/tty)
    
    clear

    # Print dialog error to screen if something happened.
    if ! [[ "$CHOICE" =~ ^[0-9]+$ ]]
    then
        printf "${RED} $CHOICE \n ${NC}"
    fi

    # Verify cursewords is installed:


    pull_Puz $STAMP $CHOICE $PuzzDir
}

grabPuz

