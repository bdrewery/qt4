/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QML Shaders plugin of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 1.0
import Qt.labs.shaders 1.0

Rectangle {
    anchors.fill: parent;
    color: "black"

    Text {
        id: text
        anchors.centerIn: parent
        font.pixelSize:  80
        text: "Shaderz!"
    }

    ShaderEffectSource {
        id: source
        sourceItem: text
        hideSource: true
    }

    ShaderEffectItem {
        width: parent.width
        height: parent.height / 2
        blending: false

        property variant source: source

        fragmentShader: "
        uniform lowp sampler2D source;
        varying highp vec2 qt_TexCoord0;
        void main() {
            gl_FragColor = vec4(0, qt_TexCoord0.y, 1, 1) * texture2D(source, qt_TexCoord0).a;
        }
        "
    }

    ShaderEffectItem {
        width: parent.width
        y: parent.height / 2
        height: parent.height / 2

        property variant source: source

        fragmentShader: "
        uniform lowp sampler2D source;
        varying highp vec2 qt_TexCoord0;
        void main() {
            gl_FragColor = vec4(qt_TexCoord0.x, 1, 0, 1) * texture2D(source, qt_TexCoord0).a;
        }
        "
    }
}
