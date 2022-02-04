#include <Arduino.h>
#include <millisDelay.h>
#include <photoresistor.h>

#define NIGHTTIME 10
#define LIGHT_SENSOR_PIN A3
//#define LIGHT_CHECK_INTERVAL (60000 * 5)
#define LIGHT_CHECK_INTERVAL (1000 * 2)

void PhotoResistor::init()
{
  pinMode(LIGHT_SENSOR_PIN, INPUT);
}

void PhotoResistor::detect_light_levels()
{
  growLightDelay.justFinished();

  if (growLightDelay.isRunning()) {
    return;
  }

  lastLightLevelRead = analogRead(LIGHT_SENSOR_PIN);

  Serial.print("Light level = ");
  Serial.println(lastLightLevelRead);

  if (!isNightTime && get_light_level() <= NIGHTTIME)
  {
    isNightTime = true;
  }

  if (isNightTime && get_light_level() > NIGHTTIME)
  {
    isNightTime = false;
  }

  growLightDelay.finish();
  growLightDelay.start(LIGHT_CHECK_INTERVAL);
}

bool PhotoResistor::is_night()
{
  return isNightTime;
}

int16_t PhotoResistor::get_light_level()
{
  return lastLightLevelRead;
}
