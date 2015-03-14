xcode-launch
====

Launch xcode from command line.

## Usage

Launch xcode project

```
$ xcode
$ xcode sample
$ xcode sample/sample.xcodeproj
$ xcode sample1 sample2
```

Show xcode projects under current directory

```
$ xcode -l
./sample1/sample1.xcodeproj
./sample2/sample2.xcodeproj
```

Specify xcode version

```
$ xcode 4 sample
$ xcode 6-Beta6 sample1 sample2
```

Check which xcode version is installed

```
$ xcode -s
(default)
4
6-Beta3
6-Beta6
```

## Intaractive Shell

Default use peco, if you specify

```
$ export $XCODE_LAUNCH_INTERACTIVE_SHELL=percol
```

not use

```
$ export $XCODE_LAUNCH_INTERACTIVE_SHELL=
```

## Install

```
$ git clone https://github.com/yatemmma/xcode-launch.git
$ ln -s `pwd`/xcode-launch/xcode-launch.sh /usr/local/bin/xcode
```

## Support

* bash

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).

## Author

[yatemmma](https://github.com/yatemmma)
