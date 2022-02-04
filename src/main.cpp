#include <Arduino.h>
#include <millisDelay.h>
#include <growbed_pump.h>
#include <photoresistor.h>
#include <temp_sensor.h>

GrowbedPump growbedPump;
PhotoResistor photoresistor;
TempSensor temp_sensor;


#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,16,2);

millisDelay lcdUpdateDelay;

void setup()
{
  Serial.begin(9660);
  delay(1000);

  pinMode(LED_BUILTIN, OUTPUT);

  lcd.init();         // initialize the lcd
  lcd.backlight();
  lcdUpdateDelay.start(1000);

  photoresistor.init();
  //temp_sensor.init();
  growbedPump.init();
}

void loop()
{
  photoresistor.detect_light_levels();

  //sensors_event_t event = temp_sensor.get_temperature();

  //growbedPump.manageWaterInTank(photoresistor.is_night(), event.temperature, event.relative_humidity);
  growbedPump.manageWaterInTank(photoresistor.is_night(), 20, 0);

  if (lcdUpdateDelay.justFinished())
  {
    char buffer [16];

    lcd.setCursor(0, 0);
    sprintf(buffer, "PT %d", growbedPump.remaining_time_seconds());
    lcd.Print::write(buffer);

    //memset(buffer, 0, sizeof(buffer));
    lcd.setCursor(0, 1);
    sprintf(buffer, "Light %d Night %s", photoresistor.get_light_level(), photoresistor.is_night() ? "Y" : "N");
    lcd.Print::write(buffer);

    lcdUpdateDelay.repeat();
  }
}
