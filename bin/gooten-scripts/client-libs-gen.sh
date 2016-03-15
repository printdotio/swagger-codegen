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

java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l csharp -o ./output/clients/CSharp/Gooten.API.CSharpClient
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l java -o ./output/clients/Java/Gooten.API.JavaClient
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l clojure -o ./output/clients/Clojure/gooten-api-clojure-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l javascript -o ./output/clients/NodeJS/gooten-api-nodejs-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l python -o ./output/clients/Python/gooten-api-python-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l ruby -o ./output/clients/Ruby/gooten-api-ruby-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l php -o ./output/clients/PHP/gooten-api-php-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l objc -o ./output/clients/Objective-C/gooten-api-objectivec-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l swift -o ./output/clients/Swift/gooten-api-swift-client
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l android -o ./output/clients/Android/gooten-api-android-client
