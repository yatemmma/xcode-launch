#!/bin/bash

APPNAME="xcode-launch"
VERSION=0.0.3

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
	VERSIONS=`ls /Applications/ | grep "^Xcode.*\.app" | sed -e 's/^Xcode.app$/(default)/' | sed -e 's/Xcode\(.*\).app/\1/'`
	if [ "x$VERSIONS" = "x" ]; then
		echo "xcode not found in /Applications"
	else
		echo "$VERSIONS"
	fi
}

show_projects() {
    find $* -type d -name '*.xcodeproj'
}

for opt in $*
do
    case $opt in
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
            show_projects .
            exit
            ;;
    esac
done

if [ -d "/Applications/Xcode$1.app" ]; then
    XCODE_PATH="/Applications/Xcode$1.app"
    shift
else
    XCODE_PATH="/Applications/Xcode.app"
fi

ARGS=$*
if [ x$ARGS = x ]; then
    ARGS="."
fi

FIND_COUNT=`show_projects $ARGS 2>/dev/null | wc -l `
if [ $FIND_COUNT -eq 0 ]; then
    echo "xcode project not found."
    exit
fi

if [ -z "${XCODE_LAUNCH_INTERACTIVE_SHELL+x}" ]; then
    peco -h >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        XCODE_LAUNCH_INTERACTIVE_SHELL=peco
    fi
fi

if [ $FIND_COUNT -eq 1 ]; then
    PROJECTS=`show_projects $ARGS`
elif [ x$XCODE_LAUNCH_INTERACTIVE_SHELL != x ]; then
    PROJECTS=`show_projects $ARGS | $XCODE_LAUNCH_INTERACTIVE_SHELL`
else
    show_projects $ARGS
    echo "open multiple projects? [Y/n]"
    read ANSWER
    case $ANSWER in
        "" | "Y" | "y" | "yes" | "Yes" | "YES")
            PROJECTS=`show_projects $ARGS`
            ;;
        *) 
            exit
            ;;
    esac
fi

for project in $PROJECTS
do
	if [ -d $project ]; then
		echo "open -a $XCODE_PATH $project"
		open -a $XCODE_PATH "$project"
	fi
done
