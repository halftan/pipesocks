/*
This file is part of pipesocks. Pipesocks is a pipe-like SOCKS5 tunnel system.
Copyright (C) 2016  yvbbrjdr

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

#ifndef TAP_H
#define TAP_H

#include <QObject>
#include <QJsonDocument>
#include <QVariantMap>
#include <QDateTime>
#include <QHostAddress>
#include "tcpsocket.h"
#include "securesocket.h"
#include "version.h"

class Tap : public QObject {
    Q_OBJECT
public:
    explicit Tap(qintptr handle,const QString &RemoteHost,unsigned short RemotePort,const QString &Password,QObject *parent = 0);
private:
    enum Status {
        Initiated,
        Handshook,
        CONNECT
    };
    QString Password;
    Status status;
    TcpSocket *csock;
    SecureSocket *ssock;
private slots:
    void ClientRecv(const QByteArray &Data);
    void ServerRecv(const QByteArray &Data);
    void EndSession();
};

#endif // TAP_H
