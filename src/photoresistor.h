#include <Arduino.h>
#include <millisDelay.h>

class PhotoResistor
{
private:
  bool isNightTime = false;
  millisDelay growLightDelay;
  int16_t lastLightLevelRead = 0;

public:
  void init();
  void loop(bool);
  void detect_light_levels();
  bool is_night();
  int16_t get_light_level();
};
