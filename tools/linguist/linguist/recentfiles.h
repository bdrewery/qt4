/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Linguist of the Qt Toolkit.
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

#ifndef RECENTFILES_H
#define RECENTFILES_H

#include <QString>
#include <QStringList>
#include <QTimer>

QT_BEGIN_NAMESPACE

class RecentFiles : public QObject
{
    Q_OBJECT

public:
    explicit RecentFiles(const int maxEntries);

    bool isEmpty() { return m_strLists.isEmpty(); }
    void addFiles(const QStringList &names);
    QString lastOpenedFile() const {
        if (m_strLists.isEmpty() || m_strLists.first().isEmpty())
            return QString::null;
        return m_strLists.at(0).at(0);
    }
    const QList<QStringList>& filesLists() const { return m_strLists; }

    void readConfig();
    void writeConfig() const;

public slots:
    void closeGroup();

private:
    bool m_groupOpen;
    bool m_clone1st;
    int m_maxEntries;
    QList<QStringList> m_strLists;
    QTimer m_timer;
};

QT_END_NAMESPACE

#endif // RECENTFILES_H
