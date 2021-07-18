#include "stm32f1xx.h"

void LED_Init();

void delay(int time) {
  volatile int count = time;
  while (count--);
}

int main(void) {
  LED_Init();

  while(1) {
    GPIOC->BSRR |= GPIO_BSRR_BS13;
    delay(500000);
    GPIOC->BSRR |= GPIO_BSRR_BR13;
    delay(500000);
  }

  return 0;
}

void LED_Init() {
  // On Board LED = PC13

  // Enable the GPIO Clock for Port C using the APB2 register
  // PG 114:
  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;

  // Set any control registers for PortC Pin 13
  // Set pin 13 to general purpose output (open drain)
  // PG 172: GPIOC_CRH CNF (pin 13 is in HIGH register) set to 01
  // (its probably reset to this state already)
  GPIOC->CRH |= GPIO_CRH_CNF13_0;
  GPIOC->CRH &= ~GPIO_CRH_CNF13_1;

  // Output Speed
  // PG 172: GPIOC_CRH MODE13 = 10 for 2 MHz
  GPIOC->CRH &= ~GPIO_CRH_MODE13_0;
  GPIOC->CRH |= GPIO_CRH_MODE13_1;
}
