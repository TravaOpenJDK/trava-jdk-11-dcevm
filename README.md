Trava-jdk-11-dcevm
==================
<p align="left">
    <a href="https://travis-ci.org/TravaOpenJDK/trava-jdk-11-dcevm">
        <img src="https://api.travis-ci.org/TravaOpenJDK/trava-jdk-11-dcevm.svg" alt="Build Status">
    </a>
    <a href="http://www.apache.org/licenses/LICENSE-2.0.html">
        <img src="http://img.shields.io/:license-apache-blue.svg" alt="License">
    </a>
    <a href="https://gitter.im/HotswapProjects/user">
        <img src="https://badges.gitter.im/Join%20Chat.svg" alt="Gitter">
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=HSwapAgent">
        <img src="https://img.shields.io/twitter/follow/HSwapAgent.svg?style=social&logo=twitter" alt="follow on Twitter">
    </a>
</p>

TravaOpenJDK is OpenJDK for developers. Since it is based on **dcevm** and integrated **HotswapAgent**, it allows **advanced hotswap** like method-field addition and many more. Trava is a build farm created and maintained by [HotswapProjects](https://github.com/HotswapProjects). Build is transparent as much as possible. [dcevm-11 source code](https://github.com/HotswapProjects/openjdk-jdk11u-dcevm) is built on [Travis](https://travis-ci.org/TravaOpenJDK/trava-jdk-11-dcevm) and the produced JDK images are bundled with [HotswapAgent](https://github.com/HotswapProjects/HotswapAgent). Building is exclusively based on [modified](https://github.com/TravaOpenJDK/openjdk-build/tree/travaopenjdk) AdoptOpenJDK [scripts](https://github.com/AdoptOpenJDK/openjdk-build).

## Install
Download [windows/linux/macos binaries](https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases), unpack and set JAVA_HOME to it's location (or add it as JDK to your IDE).

##  News since Dcevm11.0.10

Starting with 11.0.10 the TravaJDK can be used as a replacement of standard OpenJDK. Therefore starting with this release the enhanced redefinition is disabled by default. However it can be enabled for debugging using one of the following options:

- `-XX:+AllowEnhancedClassRedefinition` - explicitly turn on advanced redefinition
- `-XX:HotswapAgent=fatjar` turns on advanced redefinition and internal fatjar HotswapAgent
- `-XX:HotswapAgent=core` turns on advanced redefinition and internal core HotswapAgent
- `-XX:HotswapAgent=external` turns on advanced redefinition and advanced redefinition setups HotswapAgent support in JVM and leaves settings of external HotswapAgent on user. 

##  News since Dcevm11.0.9 

### New JVM option -XX:HotswapAgent 
Starting with dcevm-11.0.9 HotswapAgent is disabled by default. HotswapAgent support can be enabled in 3 different modes:
- `-XX:HotswapAgent=fatjar` turns on internal fatjar HotswapAgent
- `-XX:HotswapAgent=core` turns on internal core HotswapAgent
- `-XX:HotswapAgent=external` setup HotswapAgent support in JVM and leaves settings of external HotswapAgent on user. User must supply hotswap-agent.jar using additional argument e.g. `-javaagent:<path>/hotswap-agent.jar`
- `disabled` - default value.

`HotswapAgent=core` mode has no plugins except of core JVM plugins. It is faster since less scanning tasks and less class copying are necessary to be done. Additional plugins must be configured as maven dependencies in `pom.xml`. In `HotswapAgent=core` mode all plugins are available from start, it slows down application start little bit.

### G1 garbage collector is default
Since dcevm11.0.9 G1 is default garbage collector, it improves compatibility with standard JDK. It is first necessary step to replace system JDK by dcevm in the future. Serial GC can be turn on by standard option `-XX:+UseSerialGC`

## Configure
For HotswapAgent configuration look at [hotswapagent.org](http://hotswapagent.org/). HotswapAgent support can be turned on using option `-XX:HotswapAgent=[fatjar,core,external]`

## Additional Info

### Changes in dcevm11
Starting with dcevm11 option **-XXaltjvm=dcevm** is not supported anymore. There is a full java-11-openjdk distribution instead of it.

### Content
* java11-openjdk-dcevm-linux.tar.gz - **linux** x64 JDK binary bundled with latest SNAPHOT release of hotswap-agent.jar
* java11-openjdk-dcevm-windows.zip - **windows** x64 JDK binary bundled with latest SNAPHOT release of hotswap-agent.jar
* java11-openjdk-dcevm-osx.tar.gz - **macos** JDK binary bundled with latest SNAPHOT release of hotswap-agent.jar

## HOWTO

### Activate Serial GC
Use `-XX:+UseSerialGC` JVM option to turn on Serial garbage collector. 

### Fallback to standard redefinition
Use option `-XX:-AllowEnhancedClassRedefinition`to disable advanced redefinition and switch JVM to standard redefinition (only in-method modifications are allowed)

### Using DCEVM image in existing java-11-openjdk
Find out `libjvm.so` inder directory `lib/server/` and copy it to existing jdk-11 to directory `lib/dcevm`, dcevm directory must be at the same level as folder `server/` with system JVM. All should work as you are used to from dcevm8. 

### Check distribution
```
hotswap@skybber ~ $ java -XX:HotswapAgent=fatjar -version
Starting HotswapAgent '/usr/lib/jvm/java-11-openjdk/lib/hotswap/hotswap-agent.jar'
HOTSWAP AGENT: 18:06:22.007 INFO (org.hotswap.agent.HotswapAgent) - Loading Hotswap agent {1.4.2-SNAPSHOT} - unlimited runtime class redefinition.
HOTSWAP AGENT: 18:06:22.221 INFO (org.hotswap.agent.config.PluginRegistry) - Discovered plugins: [Hotswapper, WatchResources, AnonymousClassPatch, ClassInitPlugin, JdkPlugin, Hibernate, Hibernate3JPA, Hibernate3, Spring, Jersey1, Jersey2, Jetty, Tomcat, ZK, Logback, Log4j2, MyFaces, Mojarra, Omnifaces, ELResolver, WildFlyELResolver, OsgiEquinox, Owb, Proxy, WebObjects, Weld, JBossModules, ResteasyRegistry, Deltaspike, GlassFish, Vaadin, Wicket, CxfJAXRS, FreeMarker, Undertow, MyBatis]
openjdk version "11.0.9" 2020-10-20
OpenJDK Runtime Environment (build 11.0.9+0)
```
With HotswapAgent disabled:

```
hotswap@skybber ~ $ java -version
openjdk version "11.0.9" 2020-10-20
OpenJDK Runtime Environment (build 11.0.9+0)
Dynamic Code Evolution 64-Bit Server VM (build 11.0.9+0, mixed mode)

```

## Package info
* Cuncurrent Mark Sweep GC support - use `-XX:+UseConcMarkSweepGC` VM option to turn on this feature.
* Newest HotswapAgent 1.4.1


## Build your binaries!
It is not necessary to use supplied binaries, you can build your own binaries. It is simple and it can be done in several
clicks:

* Fork this repository
* Create user account on [Travis](https://travis-ci.org/)
* Change the **deploy** part in `.travis.yml` to upload the result to your repository
* Create a tagged commit and wait for Travis to build your binaries!


## HOWTO deploy a new release

### New branch
If a new branch is created in source repository, then modify `--branch` parameter in `.travis.yml` to the new branch.

### Release with existing TAG
* If repository has some updates since last tagged, then move tag:
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
