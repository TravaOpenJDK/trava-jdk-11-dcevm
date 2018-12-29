# Changelog for 

## Version 11.0.1+7 (2018-12-29)

1. Fix bug in Concurrent Mark Sweep sweep phase
1. Optimize redefinition by selective clearing of CodeCache entries if the class instance is not changed (no field changes)

## Dcevm-11.0.1+6 (2018-12-23)

1. Cuncurrent Mark Sweep GC support. Use -XX:+UseConcMarkSweepGC VM option to turn it on.

## Dcevm-11.0.1+5 (2018-12-16) and before

1. Fix method handles + Field handles (static + instance)
1. "HotswapAgent not found on path:.." is not printed out on start if hotswap-agent.jar is missing in lib/hotswap/. So jvm image can be used as alternative jdk image (-XXaltjvm=dcevm) without hotswap-agent without unpleasant messages.
1. Newest HotswapAgent 1.3.1-SNAPHOT (including new WicketPlugin)
1. fix HotswapProjects/openjdk-jdk11u#1
