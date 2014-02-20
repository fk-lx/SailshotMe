import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    PageHeader {
        id: pghead
        title: "Settings"
    }

    SilicaFlickable {

        anchors.bottom: pghead.bottom
        contentHeight: column.height

        Column {
            id: column
            x: Theme.paddingLarge
            width: page.width - 2 * x
            spacing: Theme.paddingMedium

            TextSwitch {
                id: sounsSwitch
                checked: soundsEnabled
                text: "Shutter sound"
                description: "Plays shutter sound while taking a screenshot"

                onCheckedChanged: {
                    checked ? soundsEnabled = true : soundsEnabled = false
                }
            }
        }
    }
}
