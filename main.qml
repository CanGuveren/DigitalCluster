import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 2.15
import QtQuick.Effects


Window {
    width: 1920
    height: 720
    visible: true
    title: qsTr("Cluster HMI")
    Rectangle {
            id: background
            color: "#404040"
            anchors.fill: parent
        }

    GaugeItem {
        id: powerGauge
        x : 45
        y : 60
        indexFactor: 1
        Connections {
            target: powerGaugeHandler
            onNeedleValueChanged: {
                // Needle açısını güncelle
                powerGauge.rotationVal = powerGaugeHandler.needleValue;
            }
        }
    }

    GaugeItem {
        id: speedGauge
        x : 1275
        y : 60
        indexFactor: 20
        lastIndexColor: "white"
        Connections {
            target: powerGaugeHandler
            onNeedleValueChanged: {
                // Needle açısını güncelle
                speedGauge.rotationVal = powerGaugeHandler.needleValue;
            }
        }
    }
    /*
    property point gaugePos: Qt.point(45, 60)

    Rectangle {
        id: background
        color: "gray"
        anchors.fill: parent
    }

    Image {
        id: gaugeBackground
        source: "qrc:/images/gauge_images/gauge_background.png"
        x: gaugePos.x
        y: gaugePos.y
    }

    Image {
        id: gaugeBlueCircle
        source: "qrc:/images/gauge_images/gauge_blue_circle.png"
        x: 45
        y: 60
    }

    Item{
        id: mask
        width: 600
        height: 600
        anchors.top: gaugeWhiteCircle.top
        anchors.left: gaugeWhiteCircle.left
        visible: false
        Shape {
            id: maskWhiteCircle
            // Inner blue arc:
            ShapePath {
                fillColor: "transparent"
                strokeColor: "blue"
                strokeWidth: 30
                capStyle: ShapePath.FlatCap
                PathAngleArc {
                    centerX: 300
                    centerY: 300
                    radiusX: 270
                    radiusY: 270
                    startAngle: 145
                    sweepAngle: 15
                }
            }
        }
    }

    Image {
        id: gaugeWhiteCircle
        source: "qrc:/images/gauge_images/gauge_white_circle.png"
        x: 45
        y: 60
        visible: false
    }

    MultiEffect {
         id: maskedFace
         source: gaugeWhiteCircle
         anchors.fill: gaugeWhiteCircle
         maskEnabled: true
         maskSource: ShaderEffectSource {
             sourceItem: mask
         }
     }

    Image {
        id: gaugeNeedle
        source: "qrc:/images/gauge_images/gauge_needle.png"
        x: 45
        y: 60

        RotationAnimation {
            id: needleRotation
            target: gaugeNeedle
            loops: Animation.Infinite
            from: gaugeNeedle.rotation
            to: 245
            direction: RotationAnimation.Clockwise
            duration: 10000
            running: true
        }
    }

    property int centerX: gaugeBackground.x + gaugeBackground.width / 2
    property int centerY: gaugeBackground.y + gaugeBackground.height / 2
    property int radius: 230
    property real startAngle: -120
    property real angleStep: 30
    Repeater {
        model: 9
        Text {
            id: number
            text: index
            font.pixelSize: 45
            font.bold: true
            color: index === 8 ? "red" : "white"
            property real angle: (Math.PI / 180) * (startAngle + index * angleStep)
            x: centerX + radius * Math.sin(angle) - width / 2
            y: centerY - radius * Math.cos(angle) - height / 2
        }
    }
    */
}

