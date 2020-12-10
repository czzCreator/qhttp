QT       += core network
QT       -= gui


CONFIG(debug, debug|release) {

    TARGET    = qhttpd

} else {

    TARGET    = qhttp
}



TEMPLATE = lib
#编译动态库时 开启下列宏 而且不要加上   CONFIG += staticlib
#win32:DEFINES *= QHTTP_DYNAMIC_DLL_BUILD
#win32:DEFINES *= QHTTP_DYNAMIC_DLL_USE

#编译静态库时 这么写
CONFIG += staticlib
win32:DEFINES *= QHTTP_STATIC_LIB_BUILD
#win32:DEFINES *= QHTTP_STATIC_LIB_USE


PRJDIR    = ..
include($$PRJDIR/commondir.pri)

DEFINES       *= QHTTP_MEMORY_LOG=0
#win32:DEFINES *= QHTTP_EXPORT



# Joyent http_parser
SOURCES  += $$PRJDIR/3rdparty/http-parser/http_parser.c
HEADERS  += $$PRJDIR/3rdparty/http-parser/http_parser.h

SOURCES  += \
    qhttpabstracts.cpp \
    qhttpserverconnection.cpp \
    qhttpserverrequest.cpp \
    qhttpserverresponse.cpp \
    qhttpserver.cpp

HEADERS  += \
    qhttpfwd.hpp \
    qhttpabstracts.hpp \
    qhttpserverconnection.hpp \
    qhttpserverrequest.hpp \
    qhttpserverresponse.hpp \
    qhttpserver.hpp

contains(DEFINES, QHTTP_HAS_CLIENT) {
    SOURCES += \
        qhttpclientrequest.cpp \
        qhttpclientresponse.cpp \
        qhttpclient.cpp

    HEADERS += \
        qhttpclient.hpp \
        qhttpclientresponse.hpp \
        qhttpclientrequest.hpp
}
