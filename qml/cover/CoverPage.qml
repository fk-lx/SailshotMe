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
import Sailfish.Silica 1.0

CoverBackground {

    Label {
        id: nonactivelabel
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingMedium
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: countdown ? 0 : 1
        text: "Use cover<br> \
               action to<br /> \
               take a new<br /> \
               screenshot<br /> \
               in <b>"+ delay +" secs</b>"
    }

    Label {
            opacity: countdown ? 1 : 0
            anchors.top: parent.top
            anchors.topMargin: Theme.paddingMedium
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: Theme.fontSizeMedium
            text: "Seconds till<br> \
                   screenshot"

        }

    Label {
        id: countdownlabel
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeHuge * 2.5
        color: Theme.highlightColor
        opacity: countdown ? 1 : 0
        text: timeLeft
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: countdown ? "image://theme/icon-cover-cancel": "image://theme/icon-camera-shutter-release"

            onTriggered: {
                if (countdown == false) {
                    timeLeft = delay
                    timer.interval = delay * 1000
                    countdown = true
                }
                else {
                    countdown = false
                }

            }

        }

    }

}


