import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Item {
    id: loginpage
    property var logstatus: 0
    ColumnLayout {
        id: columnLayout
        width: 640
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        TextField {
            id: textField1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            placeholderText:  qsTr("User Name")
        }

        TextField {
            id: textField2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            placeholderText:  qsTr("Password")
            echoMode: "Password";
        }

        TextField {
            id: textField3
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            placeholderText:  qsTr("SSID")
        }

        Rectangle {
            id: loginRect
            width: 200
            height: 60
            color: loginButton.pressed ? "#c02869ce" : "#2869ce"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            MouseArea {
                id: loginButton
                height: 60
                anchors.fill: parent
                onClicked: {
                    focus = true

                    if(tclient.connect()){
                        if((logstatus = tclient.logintoserver(textField1.text,textField2.text)) === 1){
                            connetIndicator.state = "connected"//login sucess 1
                            loginPage.visible = false
                            controlPage.visible = true
                            mainMenu.state = "allbutton"
                        }
                        else if(logstatus === 2){
                            //Login failed 2
                            connetIndicator.state = "disconnected"
                        }
                        else
                        {//channel unavailable 3
                            connetIndicator.state = "outofreach"
                        }
                    }

                    else{
                        //connection to server failed
                        connetIndicator.state = "outofreach"
                    }

                }
            }

            Label {
                id: label
                height: 60
                text: qsTr("Login")
                font.letterSpacing: 0
                padding: 2
                font.bold: true
                font.pointSize: 20
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
            }
        }

        ProgressBar {
            id: loginProgressBar
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            value: 0.5
        }
    }
}
