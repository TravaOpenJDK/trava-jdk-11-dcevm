export PATH=/cygdrive/c/tools/cygwin/bin:$PATH

url=$(curl -silent https://api.adoptopenjdk.net/openjdk10/nightly/x64_Win/ | grep 'binary_link' | grep -Eo '(http|https)://[^"]+' | head -1)
wget --quiet ${url}
zip_file=$(basename ${url})
target=$(unzip -Z1 ${zip_file} | grep 'bin/javac'  | tr '/' '\n' | tail -3 | head -1)
unzip -q ${zip_file}

export JAVA_HOME=$(cd "${target}"; pwd)
export PATH=${JAVA_HOME}/bin:$PATH 

# unset cygwin's gcc preconfigured
unset -v CC
unset -v CXX

cd ./openjdk-build
export LOG=info
./makejdk-any-platform.sh --tag "${SOURCE_JDK_TAG}" --build-variant dcevm --branch dcevm11 --disable-test-image --configure-args '-disable-warnings-as-errors --disable-hotspot-gtest' --target-file-name java11-openjdk-dcevm-${TRAVIS_OS_NAME}.zip jdk11u
