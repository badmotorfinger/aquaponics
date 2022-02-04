#include <Arduino.h>
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>
#include <millisDelay.h>

#define DHTPIN 13
#define DHTTYPE    DHT22

class TempSensor
{
private:
  sensors_event_t lastTempEvent;
  DHT_Unified dht;
  millisDelay tempDelay;

  void print_temp_data(sensors_event_t * event);
  void print_humidity_data(sensors_event_t * event);

public:
  TempSensor() : dht(DHTPIN, DHTTYPE) { };
  void init();
  sensors_event_t get_temperature();
};
