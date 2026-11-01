// SPDX-License-Identifier: MIT
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import QtQuick.Dialogs
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: config
    property alias cfg_executable: executable.text
    property alias cfg_downloadFolder: folder.text
    property alias cfg_displayName: displayName.text
    property alias cfg_sessionMinutes: minutes.value

    QQC2.TextField {
        id: displayName
        Kirigami.FormData.label: qsTr("Visible name:")
        placeholderText: qsTr("Computer name")
        Layout.fillWidth: true
    }
    RowLayout {
        Kirigami.FormData.label: qsTr("Save files to:")
        Layout.fillWidth: true
        QQC2.TextField {
            id: folder
            Layout.fillWidth: true
            placeholderText: qsTr("System downloads folder")
        }
        QQC2.Button {
            text: qsTr("Choose…")
            icon.name: "folder-open"
            onClicked: folderPicker.open()
        }
    }
    QQC2.SpinBox {
        id: minutes
        Kirigami.FormData.label: qsTr("Session duration (min):")
        from: 1
        to: 60
    }
    QQC2.TextField {
        id: executable
        Kirigami.FormData.label: qsTr("Owly executable:")
        placeholderText: qsTr("Automatic detection")
        Layout.fillWidth: true
    }
    QQC2.Label {
        Layout.fillWidth: true
        text: qsTr("Changes apply to the next session. Each incoming transfer requires your acceptance.")
        wrapMode: Text.Wrap
    }
    FolderDialog {
        id: folderPicker
        title: qsTr("Folder for received files")
        onAccepted: folder.text = decodeURIComponent(String(selectedFolder).replace(/^file:\/\//, ""))
    }
}
