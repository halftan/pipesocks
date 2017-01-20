/*
This file is part of pipesocks. Pipesocks is a pipe-like SOCKS5 tunnel system.
Copyright (C) 2017  yvbbrjdr

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.1

ApplicationWindow {
    width: 324
    height: 400
    minimumHeight: 400
    minimumWidth: 324
    maximumHeight: 400
    maximumWidth: 324
    visible: true
    title: qsTr("pipesocks GUI")
    Material.theme: Material.Dark
    Material.accent: Material.Cyan
    Material.primary: Material.BlueGrey
    font.family: qsTr("Roboto")
    color: Qt.rgba(0.188235,0.188235,0.188235,0.8)

    function showNotFilled() {
        notFilled.visible=true
    }

    function showFailedBind() {
        failedBind.visible=true
    }

    function showFileDialog() {
        fileDialog.open()
    }

    signal fileChosen(url path)

    FileDialog {
        id: fileDialog
        title: "Where to dump?"
        folder: shortcuts.home
        selectExisting: false
        nameFilters: [ "Log file (*.log)" ]
        onAccepted: fileChosen(fileDialog.fileUrl)
    }

    MessageDialog {
        id: notFilled
        title: "Error"
        text: "Blanks must be filled."
        icon: StandardIcon.Critical
    }

    MessageDialog {
        id: failedBind
        title: "Error"
        text: "Failed to bind to local port."
        icon: StandardIcon.Critical
    }

    header: ToolBar {
        Label {
            id: headerText
            objectName: "headerText"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 20
            anchors.fill: parent
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        Pipesocks {
            objectName: "pipesocks"
        }
        About {
            objectName: "about"
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        background: Rectangle {
            color: qsTr("transparent")
        }
        TabButton {
            text: qsTr("pipesocks")
        }
        TabButton {
            text: qsTr("About")
        }
    }
}
