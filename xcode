#!/bin/bash

APPNAME="xcode-launch"
VERSION=0.0.1

usage() {
cat << _END_
$APPNAME $VERSION
Usage: 
    xcode [<version>] [<projects>...]
    xcode [<option>]

Some useful options are:
    -l, --list    List all installed xcode version

_END_
}

versions() {
	VERSIONS=`ls /Applications/ | grep "^Xcode.*\.app"`
	if [ "x$VERSIONS" = "x" ]; then
		echo "xcode not found in /Applications"
	else
		echo "$VERSIONS"
	fi
}

for OPT in $*
do
    case $OPT in
        '-v' | '--version' )
            echo $APPNAME $VERSION
            exit
            ;;
        '-h' | '--help' )
            usage
            exit
            ;;
        '-l' | '--list' )
            versions
            exit
            ;;
    esac
done

XCODE_PATH="/Applications/Xcode.app"

while [ "$#" -gt 0 ]
do
	if [ -d "/Applications/Xcode$1.app" ]; then
		XCODE_PATH="/Applications/Xcode$1.app"
	else
		SEARCH_PATH="$SEARCH_PATH $1"
	fi
	shift
done

if [ "x$SEARCH_PATH" = "x" ]; then
	SEARCH_PATH=.
fi

for target in $SEARCH_PATH
do
	if [ -d $target ];then
		PROJECT_PATH="$PROJECT_PATH `find $target -type d -name '*.xcodeproj'`"
	fi
done

for project in $PROJECT_PATH
do
	if [ -d $project ];then
		echo "open -a $XCODE_PATH $project"
		open -a $XCODE_PATH "$project"
		OPENED=YES
	fi
done

if [ "x$OPENED" = "x" ];then
	echo "xcode project not found."
fi
