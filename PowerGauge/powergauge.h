#ifndef POWERGAUGE_H
#define POWERGAUGE_H

#include <QObject>
#include <QDebug>
#include <QTimer>

class PowerGauge : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int needleValue READ needleValue WRITE setNeedleValue NOTIFY needleValueChanged FINAL)

public:
    explicit PowerGauge(QObject *parent = nullptr);

    int needleValue() const;

public slots:
    void setNeedleValue(int newNeedleValue);

    void needleTimerTimeout();

signals:

    void needleValueChanged();

private:
    int m_needleValue;
    int sumVal;
    QTimer *m_needleTimer;

};

#endif // POWERGAUGE_H
