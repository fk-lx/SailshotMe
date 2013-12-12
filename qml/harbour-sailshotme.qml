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
import "pages"
import "cover"

//Cannot be used as it is considered unstable api
//import org.nemomobile.dbus 1.0
import harbour.sailshotme.nemodbusinterface 1.0

ApplicationWindow
{
    id: app

    property int delay : 3 //delay before taking a screenshot
    property int timeLeft //time left - to display on MainPage and CoverPage
    property bool countdown //if screenshot countdown is active

    countdown: false

    initialPage: Component {

        MainPage {

            onNewslidervalue: {
                app.delay = value
            }

        }
    }

    cover: Component {

        CoverPage {
            id: cvpage

        }
    }

    DBusInterface {
        id: dbusiface
        destination: "org.nemomobile.lipstick"
        path: "/org/nemomobile/lipstick/screenshot"
        iface: "org.nemomobile.lipstick"
    }

    Audio {
        id: shotSound
        autoLoad: false
        source: "/usr/share/sounds/freedesktop/stereo/camera-shutter.oga"
    }

    Timer {
        id: timer
        running: countdown

        onTriggered: {
            countdown = false
            dbusiface.call("saveScreenshot","")
            shotSound.play()
        }
    }

    Timer {
        id: timersec
        interval: 1000
        repeat: true
        running: countdown

        onTriggered: {
            timeLeft -= 1
        }
    }
}
