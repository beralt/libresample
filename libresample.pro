#-------------------------------------------------
#
# Project created by QtCreator 2019-05-24T11:14:45
#
#-------------------------------------------------

QT       -= core gui

TARGET = resample
TEMPLATE = lib

DEFINES += LIBRESAMPLE_LIBRARY

VERSION = 0.1.4

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += ./include

config_h.input = src/configtemplate.h
config_h.output = config.h
QMAKE_SUBSTITUTES = config_h

SOURCES += \
    src/filterkit.c \
    src/resample.c \
    src/resamplesubs.c

HEADERS += \
    include/libresample.h \
    src/configtemplate.h \
    src/filterkit.h \
    src/resample_defs.h


unix {
    target.path = /usr/lib
    INSTALLS += target
}
