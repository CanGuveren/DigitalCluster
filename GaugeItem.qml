import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 2.15
import QtQuick.Effects

Item {
    id: gaugeObject
    width: 600
    height: 600

    property int centerX: gaugeBackground.x + gaugeBackground.width / 2
    property int centerY: gaugeBackground.y + gaugeBackground.height / 2
    property int radius: 220
    property real startAngle: -120
    property real angleStep: 30
    property int rotationVal: 0
    property int indexFactor: 1
    property color lastIndexColor: "red"

    Image {
        id: gaugeBackground
        source: "qrc:/images/gauge_images/gauge_background.png"
    }
    Image {
        id: gaugeBlueCircle
        source: "qrc:/images/gauge_images/gauge_blue_circle.png"
    }

    Item {
        id: gaugeMask
        width: 600
        height: 600
        anchors.top: gaugeWhiteCircle.top
        anchors.left: gaugeWhiteCircle.left
        visible: false

        Shape {
            id: maskWhiteCircle
            ShapePath {
            fillColor: "transparent"
            strokeColor: "blue"
            strokeWidth: 30
            capStyle: ShapePath.FlatCap
            PathAngleArc {
                centerX: width / 2
                centerY: height / 2
                radiusX: 270
                radiusY: 270
                startAngle: 145
                sweepAngle: 4 + rotationVal
                }
            }
        }
    }

    Image {
        id: gaugeWhiteCircle
        source: "qrc:/images/gauge_images/gauge_white_circle.png"
        visible: false
    }

    MultiEffect {
        id: maskObject
        source: gaugeWhiteCircle
        anchors.fill: gaugeWhiteCircle
        maskEnabled: true
        maskSource: ShaderEffectSource {
            sourceItem: gaugeMask
        }
    }

    Image {
        id: gaugeNeedle
        source: "qrc:/images/gauge_images/gauge_needle.png"
        rotation: rotationVal
    }

    Repeater {
        model: 9
        Text {
            id: gaugeNumber
            text: index * indexFactor
            font.pixelSize: 40
            font.bold: true
            color: index === 8 ? lastIndexColor : "white"
            property real angle: (Math.PI / 180) * (startAngle + index * angleStep)
            x: centerX + radius * Math.sin(angle) - width / 2
            y: centerY - radius * Math.cos(angle) - height / 2
        }
    }

    Image {
        id: gaugeInside
        source: "qrc:/images/gauge_images/gauge_inside.png"
    }
}
