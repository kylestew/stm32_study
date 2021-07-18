#include "stm32f1xx.h"
#include "TM1637.h"

TM1637 display(RCC_APB2ENR_IOPBEN, GPIOB, 8, GPIOB, 9);

void delayMS(uint16_t us) {
  for (uint32_t i = 0; i < us * 1000; i++) { asm("nop"); }
}

int main(void) {
  display.begin();
  display.setBacklight(100);

  while(1) {
    display.print("LOOP");                // display LOOP on the display
    delayMS(1000);
    display.clear();                      // clear the display
    for (uint8_t i=0; i < 100; i++) {     // loop from 0 to 100
      display.print(i);                   // display loop counter
      delayMS(100);                         // wait 100 ms
    };
    delayMS(1000);
  }

  return 0;
}
