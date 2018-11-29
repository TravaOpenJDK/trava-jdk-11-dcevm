Trava dcevm-11 
==============
Dcevm-11 built on Travis, driven by AdoptOpenJDK scripts.

## Motivation:

Dcevm missed automated builds for a long time! Thanks to iron from Travis and scripts from AdoptOpenJDK we 
have all what we need now. 

## Build your binaries!
Even better, it is not necessary to use supplied binaries, you can build the binaries youself. It can be done in several
clicks:

* Fork this repository
* Create user account on [Travis](https://travis-ci.org/)
* Change the **deploy** part in `.travis.yml` to upload the result to your repository
* Create tagged commit and wait for your binaries!

### HOWTO deploy release with existing TAG
* If this repository has some updates since last tagged, then move tag:
```
    git push origin :refs/tags/${SOURCE_JDK_TAG}
    git tag -fa ${SOURCE_JDK_TAG}
    git push origin master --tags
```
* Cleanup binaries from Releases/
* Trigger tagged job on Travis (if not triggered automatically)

### HOWTO make release with new TAG
* Create empty commit in this repository and tag it with exactly same tag as is in the source JDK repository (dcevm-11.X.Y+Z)
* Appropriate a new tagged job should be created on Travis automatically
