#include <Arduino.h>
#include <millisDelay.h>
#include <growbed_pump.h>
#include <photoresistor.h>

GrowbedPump growbedPump;
PhotoResistor photoresistor;

void setup()
{
  Serial.begin(9660);
  delay(1000);

  pinMode(LED_BUILTIN, OUTPUT);

  growbedPump.init();
  photoresistor.init();

  delay(1000);
}

void loop()
{
  photoresistor.detect_light_levels();

  growbedPump.manageWaterInTank(photoresistor.is_night());
}
