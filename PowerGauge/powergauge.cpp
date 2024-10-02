#include "powergauge.h"

PowerGauge::PowerGauge(QObject *parent) : QObject{parent}, m_needleValue{0}
{
    m_needleTimer = new QTimer(this);
    m_needleTimer->setInterval(10);
    m_needleTimer->setSingleShot(false);
    connect(m_needleTimer, &QTimer::timeout, this, &PowerGauge::needleTimerTimeout);
    m_needleTimer->start();

}

int PowerGauge::needleValue() const
{
    return m_needleValue;
}

void PowerGauge::needleTimerTimeout()
{
    if(m_needleValue == 0)
    {
        sumVal = 1;
    }
    if(m_needleValue == 245)
    {
        sumVal = -1;
    }
    m_needleValue += sumVal;
    qInfo() << "time : " << m_needleValue;
    emit needleValueChanged();
}

void PowerGauge::setNeedleValue(int newNeedleValue)
{
    if (m_needleValue == newNeedleValue)
        return;
    m_needleValue = newNeedleValue;
    emit needleValueChanged();
}
