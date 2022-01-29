#include <Arduino.h>
#include <millisDelay.h>
#include <growbed_pump.h>
#include <photoresistor.h>
#include <temp_sensor.h>

GrowbedPump growbedPump;
PhotoResistor photoresistor;
TempSensor temp_sensor;

void setup()
{
  Serial.begin(9660);
  delay(1000);

  pinMode(LED_BUILTIN, OUTPUT);

  growbedPump.init();
  photoresistor.init();
  temp_sensor.init();
}

void loop()
{
  photoresistor.detect_light_levels();

  sensors_event_t event = temp_sensor.get_temperature();

  growbedPump.manageWaterInTank(photoresistor.is_night(), event.temperature, event.relative_humidity);
}
