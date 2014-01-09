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

    signal newslidervalue(int value)
    signal newrepetitionsslidevalue(int value)

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height


        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
        }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

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

                onDownChanged: {
                    if (down == false) {
                        newslidervalue(value)
                    }
                }

            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - x
                text: "Select how many screenshots you would like to take:"
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                x: Theme.paddingLarge
                text: repetitionsSlider.value + " screenshots"
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Slider {
                id: repetitionsSlider
                minimumValue: 1
                maximumValue: 60
                value: repetitions
                stepSize: 1
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

                onDownChanged: {
                    if (down == false) {
                        newrepetitionsslidevalue(value)
                    }
                }

            }

            Button {
                id: takescrbtn
                text: (repetitions > 1)? "Take screenshots": "Take screenshot"
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    timeLeft = slider.value
                    timer.interval = slider.value * 1000
                    repetitionsLeft = repetitionsSlider.value
                    countdown = true
                }
            }

            Button {
                id: cancelscrbtn
                text: "Cancel screenshot"
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: countdown ? 1 : 0

                Behavior on opacity {
                    PropertyAnimation { duration: 200 }
                }

                onClicked: {
                    countdown = false
                }
            }

            Label {
                id: timerseclabel
                opacity: countdown ? 1 : 0
                text: "Screenshot in <b>" + timeLeft + " seconds</b>"
                x: Theme.paddingLarge
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter

                Behavior on opacity {
                    PropertyAnimation { duration: 200 }
                }
            }

            Label {
                id: repetitionslabel
                opacity: countdown && repetitions > 1 ? 1 : 0
                text: "<b>" + repetitionsLeft + "</b> screenshots to take"
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





