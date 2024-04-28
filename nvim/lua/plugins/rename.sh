#! /usr/bin/bash

files=$(ls)
for FILE in $files
do
	if [ "$1" == "add" ]
		then 
		if [ "$FILE" != "init.lua" ] && [ "$FILE" != "rename.sh" ] && [ "$FILE" != "nightfox" ]
		then
			if [[ $FILE != *.lua ]]
			then
				mv $FILE $FILE.lua
			fi
		fi
	fi

	if [ "$1" == "remove" ]
	then
		if [ "$FILE" != "init.lua" ] && [ "$FILE" != "rename.sh" ]
		then
			if [[ $FILE == *.lua ]]
			then
				mv $FILE ${FILE: 0: -4}
			fi
		fi
	fi
done
