QT          += core network
QT          -= gui
CONFIG      += console
osx:CONFIG  -= app_bundle

TARGET       = basic-server
TEMPLATE     = app

PRJDIR       = $$PWD/../..
include($$PRJDIR/commondir.pri)


CONFIG(debug, debug|release) {

    LIBS        += -lqhttpd

} else {

    LIBS        += -lqhttp
}



HEADERS     +=

SOURCES     += main.cpp


