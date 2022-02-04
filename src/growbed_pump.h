#include <millisDelay.h>

class GrowbedPump
{
  bool isWaterPumpOn = false;
  millisDelay pumpDelay;

public:
  void init();
  void manageWaterInTank(bool, float, float);
  uint16_t remaining_time_seconds();
};
