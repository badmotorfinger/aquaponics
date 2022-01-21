#include <millisDelay.h>

class GrowbedPump
{
  bool isWaterPumpOn = false;
  millisDelay pumpDelay;

public:
  void init();
  void loop(bool);
  void manageWaterInTank(bool);
};
