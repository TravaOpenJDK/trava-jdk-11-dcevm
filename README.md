Trava dcevm-11
==============
The main objective of this project is to make transparent build of [dcevm-11](https://github.com/HotswapProjects/openjdk-jdk11u) and integrated it with [HotswapAgent](https://github.com/HotswapProjects/HotswapAgent). Build is done on Travis using [AdoptOpenJDK build scripts](https://github.com/AdoptOpenJDK/openjdk-build).

## Install
Download [windows/linux/macos binaries](https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases), unpack and set JAVA_HOME to it’s location (or add it as JDK to your IDE).

## Configure
Everything is configured for you, just run your application with downloaded JDK. For HotswapAgent configuration look at [hotswapagent.org](http://hotswapagent.org/)

## Build your binaries!
It is not necessary to use supplied binaries, you can build own binaries. It is simple and it can be done in several
clicks:

* Fork this repository
* Create user account on [Travis](https://travis-ci.org/)
* Change the **deploy** part in `.travis.yml` to upload the result to your repository
* Create tagged commit and wait for Travis to build your binaries!


## HOWTO deploy a new release

### Release with existing TAG
* If this repository has some updates since last tagged, then move tag:
```
    git push origin :refs/tags/${SOURCE_JDK_TAG}
    git tag -fa ${SOURCE_JDK_TAG}
    git push origin master --tags
```
* Cleanup binaries from Releases/
* Trigger tagged job on Travis (if not triggered automatically)

### Release with new TAG
* Create empty commit in this repository and tag it with exactly same tag as is in the source JDK repository (dcevm-11.X.Y+Z)
* Appropriate a new tagged job should be created on Travis automatically
