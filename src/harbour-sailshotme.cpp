#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>

#include <QtGlobal>
#include <QtQml>
#include <QQmlExtensionPlugin>

// Added until org.nemomobile.dbus becomes stable API

#include "src/nemodbus/src/declarativedbusinterface.h"

// --------------------------------------------------

int main(int argc, char *argv[])
{
    qmlRegisterType<DeclarativeDBusInterface>("harbour.sailshotme.nemodbusinterface", 1,0, "DBusInterface");
    return SailfishApp::main(argc, argv);
}
