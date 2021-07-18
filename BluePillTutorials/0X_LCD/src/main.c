#include "stm32f1xx.h"

#include "lcd_driver.h"


int main(void) {
  lcd_init();

  char character = 'A'; // 65 = 0b01000001
  lcd_send_character(character);

  while(1) {
  }

  return 0;
}
