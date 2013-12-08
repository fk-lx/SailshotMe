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


Page {
    id: page

    PageHeader {
        id: pghead
        title: "About"
    }

    SilicaFlickable {

        anchors.bottom: pghead.bottom
        contentHeight: column.height

        Column {
            id: column
            x: Theme.paddingLarge
            width: page.width - x
            spacing: Theme.paddingMedium

            Label {
                text: "SailshotMe Version 1.0"
                font.pixelSize: Theme.fontSizeMedium
                color: Theme.highlightColor
            }

            Label {
                id: body

                text: "This is a very simple app to take screenshots. If you want to help with it's development you are more than welcome as it has a lot of room for improvement. The source code is available on Github.<br \> The most parts of app are on GPLv3 license, except qml DBusInterface component, which origins from nemo-qml-plugin-dbus that is on LGPL 2.1 license."

                font.pixelSize: Theme.fontSizeExtraSmall
                wrapMode: Text.WordWrap
                maximumLineCount: 10

                truncationMode: TruncationMode.Fade

                anchors {
                    left: parent.left
                    right: parent.right
                }

                //onLinkActivated: Qt.openUrlExternally("https://github.com/fk-lx/SailshotMe/")
            }

            Label {
                text: "Author:"
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.highlightColor
            }

            Label {
                text: "Filip Kłębczyk"
                font.pixelSize: Theme.fontSizeExtraSmall
            }

            Label {
                text: "Credits:"
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.highlightColor
            }

            Label {
                text: "Thomas Rücker (for testing on real device)"
                font.pixelSize: Theme.fontSizeExtraSmall
            }

            Label {
                text: "John Brooks (for checking fixed version)"
                font.pixelSize: Theme.fontSizeExtraSmall
            }
        }
    }

}





