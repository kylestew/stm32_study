#include "stm32f1xx.h"

void BUTTON_Init();
void LED_Init();

char isLEDOn = 0;

volatile char buttonPressed = 0;
volatile int buttonPressedConfidenceLevel = 0;
volatile int confidenceThreshold = 200;

void toggleLED() {
  if (isLEDOn) {
    isLEDOn = 0;
    GPIOC->BSRR |= GPIO_BSRR_BR13;
  } else {
    isLEDOn = 1;
    GPIOC->BSRR |= GPIO_BSRR_BS13;
  }
}

int main(void) {
  LED_Init();
  BUTTON_Init();

  while(1) {
    // toggle LED on button press
    if (GPIOB->IDR & GPIO_IDR_IDR4) {
      // debounce
      if (buttonPressed == 0) {
        if (buttonPressedConfidenceLevel++ > confidenceThreshold) {
          // event registered
          buttonPressed = 1;
          toggleLED();
        }
      }
    } else {
      buttonPressed = 0;
      buttonPressedConfidenceLevel = 0;
    }
  }

  return 0;
}

void BUTTON_Init() {
  // Custom button = PB4

  // Enable the GPIO Clock for Port B using the AHB2 reg on RCC
  // PG 114: RCC AHB2ENR set GPIOB EN (bit 1) to a 1
  RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;

  // GPIOB_CRL:MODE4 = 01 = Input - floating
  GPIOB->CRL |= GPIO_CRL_CNF4_0;
  GPIOB->CRL &= ~GPIO_CRL_CNF4_1;

  // CPIOC_CRL:MODE4 = 00 = Input
  // reset state
}

void LED_Init() {
  // On Board LED = PC13
  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
  // GPIOC_CRH:CNF13 = 01 = Output - Open Drain
  GPIOC->CRH |= GPIO_CRH_CNF13_0;
  GPIOC->CRH &= ~GPIO_CRH_CNF13_1;
  // GPIOC_CRH:MODE13 = 01 = 10 MHz
  GPIOC->CRH |= GPIO_CRH_MODE13_0;
  GPIOC->CRH &= ~GPIO_CRH_MODE13_1;
}
