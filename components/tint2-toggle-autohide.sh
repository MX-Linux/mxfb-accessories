#!/bin/bash
# Small script to toogle tint2 panel autohide

original_auto_hide=$(egrep "^autohide =" ~/.config/tint2/tint2rc | cut -d'=' -f2)

SUB='0'

if [[ "$original_auto_hide" == *"$SUB"* ]]; then
  selection=$(yad --title="Select tint2 toolbar autohide" --form --center --field="Autohide:CB" Off\!On)
  else 
  selection=$(yad --title="Select tint2 toolbar autohide" --form --center --field="Autohide:CB" On\!Off)
fi

selection=$(echo "${selection::-1}")

if [ "$selection" == "Off" ]
 then selection="0"
fi

if [ "$selection" == "On" ] 
 then selection="1"
fi

if [ "$selection" == "" ] 
 then exit
fi

sed -i "/^autohide =/s/$original_auto_hide/ $selection/g" ~/.config/tint2/tint2rc

# restart tint2
	killall -9 tint2
	tint2session &
	exit
	
