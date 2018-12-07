Trava dcevm-11
==============
[![Build Status](https://travis-ci.org/TravaOpenJDK/trava-jdk-11-dcevm.svg?branch=master)](https://travis-ci.org/TravaOpenJDK/trava-jdk-11-dcevm) [![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

The main objective of this project is to provide dcevm-11 binaries. Build is transparent as much as possible. [dcevm-11 source code](https://github.com/HotswapProjects/openjdk-jdk11u) is build on [Travis](https://travis-ci.org/TravaOpenJDK/trava-jdk-11-dcevm) and the destination binaries are bundled with [HotswapAgent](https://github.com/HotswapProjects/HotswapAgent). Building is exclusively based on AdoptOpenJDK [scripts](https://github.com/AdoptOpenJDK/openjdk-build).

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
Let's jdk source repository has new tag of value **TAGVAL**
* Set variable `SOURCE_JDK_TAG=` in `.tarvis.yml` to **TAGVAL**
* Commit and tag commit with **TAGVAL**
* Appropriate a new tagged job should be created on Travis automatically
