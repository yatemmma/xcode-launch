#!/bin/bash

APPNAME="xcode-launch"
VERSION=0.0.2

usage() {
cat << _END_
$APPNAME $VERSION
Usage: 
    xcode [version] [project...]
    xcode [option]

Some useful options are:
    -s, --showsdks    List all installed xcode version
    -l, --list        List xcode projects under current directory

_END_
}

show_sdks() {
	VERSIONS=`ls /Applications/ | grep "^Xcode.*\.app"`
	if [ "x$VERSIONS" = "x" ]; then
		echo "xcode not found in /Applications"
	else
		echo "$VERSIONS"
	fi
}

show_projects() {
  find . -type d -name '*.xcodeproj'
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
        '-s' | '--showsdks' )
            show_sdks
            exit
            ;;
        '-l' | '--list' )
            show_projects
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
	usage
  exit
fi

for target in $SEARCH_PATH
do
	if [ -d $target ]; then
		PROJECT_PATH="$PROJECT_PATH `find $target -type d -name '*.xcodeproj'`"
	fi
done

for project in $PROJECT_PATH
do
	if [ -d $project ]; then
		echo "open -a $XCODE_PATH $project"
		open -a $XCODE_PATH "$project"
		OPENED=YES
	fi
done

if [ "x$OPENED" = "x" ]; then
	echo "xcode project not found."
fi
