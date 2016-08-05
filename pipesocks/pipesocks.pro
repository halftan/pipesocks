# This project is created by yvbbrjdr

QT += core gui widgets network

TARGET = pipesocks

TEMPLATE = app

SOURCES += main.cpp \
    tcpsocket.cpp \
    securesocket.cpp \
    tcpserver.cpp \
    pipe.cpp \
    tap.cpp \
    pump.cpp \
    pac.cpp \
    mainwidget.cpp \
    aboutdialog.cpp \
    version.cpp

HEADERS += tcpsocket.h \
    securesocket.h \
    tcpserver.h \
    pipe.h \
    tap.h \
    pump.h \
    pac.h \
    mainwidget.h \
    aboutdialog.h \
    version.h

osx {
    LIBS += -L/usr/local/lib/
    INCLUDEPATH += /usr/local/include/
    ICON = icons/osx.icns
}

win32: RC_ICONS = icons/win.ico

LIBS += -lsodium

DISTFILES += proxy.pac

FORMS += mainwidget.ui \
    aboutdialog.ui
