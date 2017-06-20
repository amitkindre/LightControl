#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QDebug>
#include <QQmlContext>
#include <QObject>
#include "wifi.h"


#include <QNetworkConfiguration>
#include <QNetworkConfigurationManager>

#include <QNetworkInterface>


#include "tcpclient.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* contextp = engine.rootContext();




//    Wifi z;

////  qDebug() << "Config";
//    QNetworkConfigurationManager ncm;
//    QNetworkConfiguration cfg;
//    QNetworkInterface nif;

//    ncm.updateConfigurations();
//    QObject::connect(&ncm,SIGNAL(updateCompleted()),&z,SLOT(serchSSID()));


//    QList<QNetworkConfiguration> nc = ncm.allConfigurations();

//    for (auto &x : nc)
//    {
//        //if (x.bearerType() == QNetworkConfiguration::BearerWLAN)
//            qDebug() << x.name();
//    }

//    QList<QHostAddress> list = QNetworkInterface::allAddresses();
//    QString lst = nif.humanReadableName();

////    for(int nIter=0; nIter<lst.count(); nIter++)
////    {
////        qDebug() << lst[nIter].toString();
////    }

//        qDebug() << lst;

    TcpClient tClient;
    //tClient.connect();



    contextp->setContextProperty("tclient",&tClient);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    return app.exec();
}


void listSSID(){

}
