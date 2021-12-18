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

millisDelay pumpDelay;
millisDelay finalDelay;
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
}

void loop()
{
  pumpDelay.justFinished();
  growLightDelay.justFinished();

  manageWaterInTank();
  manageGrowLight();
}

void manageWaterInTank()
{
  if (finalDelay.justFinished()) {

    Serial.println("Turning off water pump");
    // Turn off water pump
    digitalWrite(WATERPUMP_PIN, LOW);
    isWaterPumpOn = false;

    uint32_t pumpOffSeconds = isNightTime ? WATERPUMP_OFF_SECONDS_NIGHTTIME : WATERPUMP_OFF_SECONDS;

    // Wait for the water to drain
    pumpDelay.finish();
    pumpDelay.start(pumpOffSeconds);
    return;
  }

  if (pumpDelay.isRunning() || finalDelay.isRunning()) {
    return;
  }

  digitalWrite(currentWaterLevel_SENSOR_ONOFF_PIN, HIGH);

  uint32_t currentWaterLevel = analogRead(currentWaterLevel_SENSOR_PIN);

  if (!isWaterPumpOn)
  {
    Serial.println("Water pump is starting up again");

    // Turn on water pump
    digitalWrite(WATERPUMP_PIN, HIGH);
    isWaterPumpOn = true;

    pumpDelay.start(2000);
    return;
  }

  Serial.print("Current water level");
  Serial.println(currentWaterLevel);

  // Only process when the water level reading is significant
  if (currentWaterLevel >= 600)
  {
    Serial.println("Water is draining. Waiting a few seconds");

    // Wait for the water to drain
    finalDelay.finish();
    finalDelay.start(5000);
  }
  else
  {
    Serial.println("Water level is still below sensor");
    pumpDelay.repeat();
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
