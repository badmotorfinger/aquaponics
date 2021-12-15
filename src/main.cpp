#include <Arduino.h>
#include <millisDelay.h>

#define NIGHTTIME 50
#define WATERPUMP_PIN 3
#define GROWLIGHT_PIN 9

#define currentWaterLevel_SENSOR_ONOFF_PIN 12
#define currentWaterLevel_SENSOR_PIN A4

#define WATERPUMP_OFF_SECONDS ((unsigned long)1000 * 60 * 15)
#define WATERPUMP_OFF_SECONDS_NIGHTTIME ((unsigned long)1000 * 60 * 60)
#define GROWLIGHT_TIME_SECONDS ((unsigned long)60 * 60 * 8)   // 8 Hours

bool isWaterPumpOn = false;
bool isNightTime = false;

int16_t lastWaterLevel = 0;

millisDelay pumpDelay;
millisDelay loopDelay;
millisDelay growLightDelay;

void manageWaterInTank();
void manageGrowLight();

void setup() {

  Serial.begin(115200);
  delay(1000);

  pinMode(LED_BUILTIN, OUTPUT);

  // Water pump pin on/off
  pinMode(WATERPUMP_PIN, OUTPUT);

  // Grow light pin on/off
  pinMode(GROWLIGHT_PIN, OUTPUT);

  // Water level reached pin
  pinMode(currentWaterLevel_SENSOR_ONOFF_PIN, OUTPUT);
  pinMode(currentWaterLevel_SENSOR_PIN, INPUT);
  digitalWrite(currentWaterLevel_SENSOR_ONOFF_PIN, LOW);

  // Light sensor pins
  pinMode(A1, INPUT);
  pinMode(A0, OUTPUT);

  // Init
  analogWrite(A0, 0);                 // Light sensor off
  digitalWrite(WATERPUMP_PIN, LOW);  // Water pump off
  digitalWrite(GROWLIGHT_PIN, LOW);   // Growlight off

  loopDelay.start(1000);
}

void loop()
{
  pumpDelay.justFinished();
  loopDelay.justFinished();
  growLightDelay.justFinished();

  if (!loopDelay.isRunning()) {
    loopDelay.repeat();
    manageWaterInTank();
    manageGrowLight();
    //lightUp();
  }
}

void manageWaterInTank()
{
  if (pumpDelay.isRunning()) {
    return;
  }

  digitalWrite(currentWaterLevel_SENSOR_ONOFF_PIN, HIGH);

  int16_t currentWaterLevel = analogRead(currentWaterLevel_SENSOR_PIN);

  if (!isWaterPumpOn)
  {
    Serial.println("Water pump is starting up again");

    lastWaterLevel = currentWaterLevel - 50;

    // Turn on water pump
    digitalWrite(WATERPUMP_PIN, HIGH);
    isWaterPumpOn = true;

    pumpDelay.finish();
    pumpDelay.start(15000); // Alow the water level to drain before taking another reading
  }

  // Only process when the water level reading is significant
  if (abs(lastWaterLevel - currentWaterLevel) >= 100)
  {
    if (currentWaterLevel < lastWaterLevel)
    {
      Serial.println("Water is still being pumped out");

      lastWaterLevel = currentWaterLevel;

      pumpDelay.finish();
      pumpDelay.start(5000); // Alow the water level to drain before taking another reading
    }
    else
    {
      Serial.println("Water is draining into fish tank");

      // Turn off water pump
      digitalWrite(WATERPUMP_PIN, LOW);
      isWaterPumpOn = false;

      uint32_t pumpOffSeconds = isNightTime ? WATERPUMP_OFF_SECONDS_NIGHTTIME : WATERPUMP_OFF_SECONDS;

      // Wait for the water to drain
      pumpDelay.finish();
      pumpDelay.start(pumpOffSeconds);
    }
  }

  digitalWrite(currentWaterLevel_SENSOR_ONOFF_PIN, LOW);
}

void manageGrowLight()
{
  if (growLightDelay.isRunning()) {
    return;
  }

  // Read light level
  analogWrite(A0, 256);
  int16_t value = analogRead(A1);
  analogWrite(A0, 0);

  if (!isNightTime && value <= NIGHTTIME)
  {
    isNightTime = true;

    // Turn on grow light
    digitalWrite(GROWLIGHT_PIN, HIGH);

    growLightDelay.finish();
    growLightDelay.start(GROWLIGHT_TIME_SECONDS);
    return;
  }

  if (isNightTime && value > NIGHTTIME)
  {
    isNightTime = false;

    // Turn off light
    digitalWrite(GROWLIGHT_PIN, LOW);
  }
  else
  {
    growLightDelay.finish();
    growLightDelay.start(60000 * 30);
  }
}
