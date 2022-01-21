#include <Arduino.h>
#include <millisDelay.h>
#include <growbed_pump.h>

#define WATERPUMP_PIN 2
#define WATERPUMP_ON_SECONDS ((unsigned long)1000 * 90)
#define WATERPUMP_OFF_SECONDS ((unsigned long)1000 * 60 * 2)
#define WATERPUMP_OFF_SECONDS_NIGHTTIME ((unsigned long)1000 * 60 * 30)

void GrowbedPump::loop(bool isNightTime)
{
  manageWaterInTank(isNightTime);
}

void GrowbedPump::init()
{
  // Water pump pin on/off
  pinMode(WATERPUMP_PIN, OUTPUT);

  // Water pump off
  digitalWrite(WATERPUMP_PIN, LOW);
}

void GrowbedPump::manageWaterInTank(bool isNightTime)
{
    pumpDelay.justFinished();

    if (pumpDelay.isRunning()) {
      return;
    }

    pumpDelay.finish();

    if (!isWaterPumpOn)
    {
      Serial.println("Water pump is starting up again");

      // Turn on water pump
      digitalWrite(WATERPUMP_PIN, HIGH);
      isWaterPumpOn = true;

      pumpDelay.start(WATERPUMP_ON_SECONDS);
    }
    else
    {
      // Turn off water pump
      digitalWrite(WATERPUMP_PIN, LOW);
      isWaterPumpOn = false;

      uint32_t pumpOffSeconds = isNightTime ? WATERPUMP_OFF_SECONDS_NIGHTTIME : WATERPUMP_OFF_SECONDS;

      // Wait for the water to drain
      pumpDelay.start(pumpOffSeconds);
    }
  }
