export PATH=/cygdrive/c/tools/cygwin/bin:$PATH

wget -q -O OpenJDK11_x64_Windows.zip "https://api.adoptopenjdk.net/v2/binary/releases/openjdk11?os=windows&release=jdk-11.0.3%2B7&arch=x64&type=jdk"
JDK_BOOT_DIR=$PWD/$(unzip -Z1 OpenJDK11_x64_Windows.zip | grep 'bin/javac'  | tr '/' '\n' | tail -3 | head -1)
unzip -q OpenJDK11_x64_Windows.zip

# unset cygwin's gcc preconfigured
unset -v CC
unset -v CXX
export JAVA_HOME=${JDK_BOOT_DIR}

cd ./openjdk-build
export LOG=info
./makejdk-any-platform.sh --tag "${SOURCE_JDK_TAG}" --build-variant dcevm  --branch dcevm11-jdk-11.0.9-adopt --jdk-boot-dir ${JDK_BOOT_DIR} --hswap-agent-download-url ${HSWAP_AGENT_DOWNLOAD_URL} --disable-test-image --check-fingerprint false --configure-args '-disable-warnings-as-errors --disable-hotspot-gtest' --target-file-name java11-openjdk-dcevm-${TRAVIS_OS_NAME}.zip jdk11u
