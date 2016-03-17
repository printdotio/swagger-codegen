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
rm -rf ./output/

java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l csharp -o ./output/clients/CSharp/Gooten.API.CSharpClient -c ./bin/gooten-scripts/configs/csharp-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l java -o ./output/clients/Java/Gooten.API.JavaClient -c ./bin/gooten-scripts/configs/java-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l clojure -o ./output/clients/Clojure/gooten-api-clojure-client -c ./bin/gooten-scripts/configs/clojure-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l javascript -o ./output/clients/NodeJS/gooten-api-nodejs-client -c ./bin/gooten-scripts/configs/nodejs-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l python -o ./output/clients/Python/gooten-api-python-client -c ./bin/gooten-scripts/configs/python-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l ruby -o ./output/clients/Ruby/gooten-api-ruby-client -c ./bin/gooten-scripts/configs/ruby-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l php -o ./output/clients/PHP/gooten-api-php-client -c ./bin/gooten-scripts/configs/php-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l objc -o ./output/clients/Objective-C/gooten-api-objectivec-client -c ./bin/gooten-scripts/configs/objectivec-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l swift -o ./output/clients/Swift/gooten-api-swift-client -c ./bin/gooten-scripts/configs/swift-config.json
java $JAVA_OPTS -jar $executable generate -i $SWAGGER_API -l android -o ./output/clients/Android/gooten-api-android-client -c ./bin/gooten-scripts/configs/android-config.json
