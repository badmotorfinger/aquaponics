#include <Arduino.h>
#include <millisDelay.h>
#include <growbed_pump.h>

#define WATERPUMP_PIN 3

#define WATERPUMP_ON_SECONDS ((unsigned long)1000 * 95)

#define WATERPUMP_OFF_HOT_DAY_SECONDS ((unsigned long)1000 * 60 * 2)
#define WATERPUMP_OFF_HOT_NIGHT_SECONDS ((unsigned long)1000 * 60 * 5)

#define WATERPUMP_OFF_SECONDS ((unsigned long)1000 * 60 * 2)
#define WATERPUMP_OFF_SECONDS_NIGHTTIME ((unsigned long)1000 * 60 * 30)

void GrowbedPump::init()
{
  // Water pump pin on/off
  //pinMode(WATERPUMP_PIN, OUTPUT);

  // Water pump off
  //digitalWrite(WATERPUMP_PIN, LOW);
}

void GrowbedPump::manageWaterInTank(bool isNightTime, float temp, float humidity)
{
    pumpDelay.justFinished();

    if (pumpDelay.isRunning()) {
      return;
    }

    if (!isWaterPumpOn)
    {
      Serial.println("Water pump is starting up again");

      // Turn on water pump
      analogWrite(WATERPUMP_PIN, 100) ;
      //digitalWrite(WATERPUMP_PIN, HIGH);

      isWaterPumpOn = true;

      pumpDelay.start(WATERPUMP_ON_SECONDS);
    }
    else
    {
      // Turn off water pump
      //digitalWrite(WATERPUMP_PIN, LOW);
      analogWrite(WATERPUMP_PIN, 0);
      isWaterPumpOn = false;

      uint32_t pumpOffSeconds = isNightTime ? WATERPUMP_OFF_SECONDS_NIGHTTIME : WATERPUMP_OFF_SECONDS;

      if (isNightTime && temp >= 27)
      {
        pumpOffSeconds = WATERPUMP_OFF_HOT_NIGHT_SECONDS;
      }
      else if (!isNightTime && temp >= 27)
      {
        pumpOffSeconds = WATERPUMP_OFF_HOT_DAY_SECONDS;
      }

      // Wait for the water to drain
      pumpDelay.start(pumpOffSeconds);

      Serial.print("Turned off water pump for seconds ");
      Serial.println(remaining_time_seconds());
    }
  }

  uint16_t GrowbedPump::remaining_time_seconds()
  {
    return pumpDelay.remaining() / 1000;
  }
