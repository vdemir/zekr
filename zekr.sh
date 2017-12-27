#!/bin/sh

# a native browser, mozilla or webkit, should be automatically looker up at runtime.
# if not found, you can can uncomment the following lines and point to a valid
# Firefox or XULRnner installation. see for more info: http://www.eclipse.org/swt/faq.php#specifyxulrunner

#export ZEKR_BROWSER="-Dorg.eclipse.swt.browser.XULRunnerPath=/usr/lib/firefox"

JAVA_CMD=java

ORIG_DIR_NAME=`cd`
DIR_NAME=`dirname $0`
MAIN_CLASS=net.sf.zekr.ZekrMain
CLASS_PATH=lib/log4j-1.2.8.jar:lib/swt.jar:lib/commons-collections-3.2.1.jar:lib/commons-codec-1.3.jar:lib/commons-io-1.4.jar:lib/commons-lang-2.4.jar:lib/commons-logging-1.0.4.jar:lib/commons-configuration-1.6.jar:lib/velocity-1.6.2.jar:lib/lucene-core-3.0.0.jar:lib/lucene-highlighter-3.0.0.jar:lib/lucene-snowball-3.0.0.jar:lib/lucene-memory-3.0.0.jar:lib/lucene-misc-3.0.0.jar:lib/mp3spi-1.9.4.jar:lib/vorbisspi-1.0.3.jar:lib/jlayer-1.0.1.jar:lib/basicplayer-3.0.jar:lib/tritonus-share-0.3.6.jar:lib/tritonus-jorbis-0.3.6.jar:lib/jorbis-0.0.17.jar:lib/jspeex-0.9.7.jar:dist/zekr.jar
VM_ARGS="-Xms20m -Xmx128m $ZEKR_BROWSER"

cd $DIR_NAME
"$JAVA_CMD" $VM_ARGS -cp "$CLASS_PATH" $MAIN_CLASS $*
cd $ORIG_DIR_NAME
