xcode-launch
====

Launch xcode from command line.

## Usage

Launch xcode project
```
$ xcode .
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
Xcode.app
Xcode4.app
Xcode6-Beta6.app
```

## Extra

with peco
```
$ xcode -l | peco | xargs xcode
```

## Install

```
$ git clone https://gist.github.com/e18f854d0a0b5955cec6.git xcode-launch
$ ln -s `pwd`/xcode-launch/xcode-launch.sh /usr/local/bin/xcode
```

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).

## Author

[yatemmma](https://github.com/yatemmma)