#!/bin/sh
# Push generate Gooten Client libs to the specified repositories

cp /c/api-client-libs/generated/CSharp/Gooten.API.CSharpClient/. /c/api-client-libs/repos/gooten-api-csharp-client/ -R
/c/api-client-libs/repos/gooten-api-csharp-client/git_push.sh

# Android generated items doesn't contains git_push.sh
# cp /c/api-client-libs/generated/Android/gooten-api-android-client/. /c/api-client-libs/repos/gooten-api-android-client/ -R
# /c/api-client-libs/repos/gooten-api-android-client/git_push.sh

cp /c/api-client-libs/generated/Clojure/gooten-api-clojure-client/. /c/api-client-libs/repos/gooten-api-clojure-client/ -R
/c/api-client-libs/repos/gooten-api-clojure-client/git_push.sh

cp /c/api-client-libs/generated/Java/Gooten.API.JavaClient/. /c/api-client-libs/repos/gooten-api-java-client/ -R
/c/api-client-libs/repos/gooten-api-java-client/git_push.sh

cp /c/api-client-libs/generated/NodeJS/gooten-api-nodejs-client/. /c/api-client-libs/repos/gooten-api-nodejs-client/ -R
/c/api-client-libs/repos/gooten-api-nodejs-client/git_push.sh

cp /c/api-client-libs/generated/Objective-C/gooten-api-objectivec-client/. /c/api-client-libs/repos/gooten-api-objectivec-client/ -R
/c/api-client-libs/repos/gooten-api-objectivec-client/git_push.sh

cp /c/api-client-libs/generated/PHP/gooten-api-php-client/SwaggerClient-php/. /c/api-client-libs/repos/gooten-api-php-client/ -R
/c/api-client-libs/repos/gooten-api-php-client/git_push.sh

cp /c/api-client-libs/generated/Python/gooten-api-python-client/. /c/api-client-libs/repos/gooten-api-python-client/ -R
/c/api-client-libs/repos/gooten-api-python-client/git_push.sh

cp /c/api-client-libs/generated/Ruby/gooten-api-ruby-client/. /c/api-client-libs/repos/gooten-api-ruby-client/ -R
/c/api-client-libs/repos/gooten-api-ruby-client/git_push.sh

cp /c/api-client-libs/generated/Swift/gooten-api-swift-client/. /c/api-client-libs/repos/gooten-api-swift-client/ -R
/c/api-client-libs/repos/gooten-api-swift-client/git_push.sh
