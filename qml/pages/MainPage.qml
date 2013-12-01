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

Page {
    id: page

    property int delay
    property int timeLeft

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

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
        }

        contentHeight: column.height


        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: "SailshotMe"
            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - x
                text: "Select time after which screenshot will be taken:"
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                x: Theme.paddingLarge
                text: slider.value + " seconds"
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Slider {
                id: slider
                minimumValue: 1
                maximumValue: 60
                value: delay
                stepSize: 1
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Timer {
                id: timer
                interval: slider.value * 1000
                onTriggered: {
                    timersec.running = false
                    dbusiface.call("saveScreenshot","")
                    timerseclabel.opacity = 0
                    shotSound.play()
                }
            }

            Button {
                text: "Make screenshot"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    timeLeft = slider.value
                    timerseclabel.opacity = 1
                    timersec.running = true
                    timer.running = true
                }
            }

            Timer {
                id: timersec
                interval: 1000
                repeat: true
                running: false

                onTriggered: {
                    timeLeft -= 1
                }
            }

            Label {
                id: timerseclabel
                opacity: 0
                text: "Screenshot in <b>" + timeLeft + " seconds<b>"
                x: Theme.paddingLarge
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter

                Behavior on opacity {
                    PropertyAnimation { duration: 200 }
                }
            }

        }

    }

}





