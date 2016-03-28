#!/bin/sh
# Generate Gooten Client libs for the specified languages
# Usage example: ./bin/gooten-scripts/client-libs-gen.sh http://qa-api.print.io/docs/api.json
SCRIPT="$0"

SWAGGER_API="$1"

while [ -h "$SCRIPT" ] ; do
  ls=`ls -ld "$SCRIPT"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    SCRIPT="$link"
  else
    SCRIPT=`dirname "$SCRIPT"`/"$link"
  fi
done

if [ ! -d "${APP_DIR}" ]; then
  APP_DIR=`dirname "$SCRIPT"`/..
  APP_DIR=`cd "${APP_DIR}"; pwd`
fi

executable="./modules/swagger-codegen-cli/target/swagger-codegen-cli.jar"

if [ ! -f "$executable" ]
then
  mvn clean package
fi

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"

# clean and rebuild code-gen-cli
rm $executable
mvn package

# clean output folder
rm -rf /c/api-client-libs/generated/

cp ./client-libs-push.sh /c/api-client-libs/ -R

java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l csharp --git-repo-id "gooten-api-csharp-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/CSharp/Gooten.API.CSharpClient -c ./bin/gooten-scripts/configs/csharp-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l java --git-repo-id "gooten-api-java-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Java/Gooten.API.JavaClient -c ./bin/gooten-scripts/configs/java-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l clojure --git-repo-id "gooten-api-clojure-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Clojure/gooten-api-clojure-client -c ./bin/gooten-scripts/configs/clojure-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l javascript --git-repo-id "gooten-api-nodejs-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/NodeJS/gooten-api-nodejs-client -c ./bin/gooten-scripts/configs/nodejs-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l python --git-repo-id "gooten-api-python-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Python/gooten-api-python-client -c ./bin/gooten-scripts/configs/python-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l ruby --git-repo-id "gooten-api-ruby-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Ruby/gooten-api-ruby-client -c ./bin/gooten-scripts/configs/ruby-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l php --git-repo-id "gooten-api-php-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/PHP/gooten-api-php-client -c ./bin/gooten-scripts/configs/php-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l objc --git-repo-id "gooten-api-objectivec-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Objective-C/gooten-api-objectivec-client -c ./bin/gooten-scripts/configs/objectivec-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l swift --git-repo-id "gooten-api-swift-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Swift/gooten-api-swift-client -c ./bin/gooten-scripts/configs/swift-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l android --git-repo-id "gooten-api-android-client" --git-user-id "$2" --release-note "$3" -o /c/api-client-libs/generated/Android/gooten-api-android-client -c ./bin/gooten-scripts/configs/android-config.json
