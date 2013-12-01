/****************************************************************************************
**
**    SailshotMe - program for taking screenshots on Sailfish
**    Copyright (C) 2013 Filip Kłębczyk <fklebczyk@gmail.com>.
**
**    This program is free software: you can redistribute it and/or modify
**    it under the terms of the GNU General Public License as published by
**    the Free Software Foundation, either version 3 of the License, or
**    (at your option) any later version.
**
**    This program is distributed in the hope that it will be useful,
**    but WITHOUT ANY WARRANTY; without even the implied warranty of
**    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**    GNU General Public License for more details.
**
**    You should have received a copy of the GNU General Public License
**    along with this program. If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************************/

import QtQuick 2.0
import QtMultimedia 5.0
import Sailfish.Silica 1.0
import org.nemomobile.dbus 1.0


CoverBackground {

    property int delay

    DBusInterface {
        id: dbusiface
        destination: "org.nemomobile.lipstick"
        path: "/org/nemomobile/lipstick/screenshot"
        iface: "org.nemomobile.lipstick"
    }

    Audio {
        id: shotSound
        source: "/usr/share/sounds/freedesktop/stereo/camera-shutter.oga"
    }

    Label {
        id: label
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingMedium
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Use cover<br> \
               action to<br /> \
               take a new<br /> \
               screenshot<br /> \
               in <b>"+ delay +" secs</b>"
    }

    Timer {
        id: timer
        interval: delay * 1000
        onTriggered: {
            dbusiface.call("saveScreenshot","")
            shotSound.play()
        }
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-camera-shutter-release"

            onTriggered: {
                timer.running = true
            }
        }

    }
}


