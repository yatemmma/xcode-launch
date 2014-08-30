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

Specify xcode version

```
$ xcode 
$ xcode 5
$ xcode 6-Beta6
```

Check which xcode version is installed
```
$ xcode -l
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