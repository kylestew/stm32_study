#pragma once

#include "stm32f1xx.h"


// 5V tollerant
/*
8 bit char D0-D7
PB8
PB9
PB10
PB11
PB12
PB13
PB14
PB15

EN: PA8
RW: PA9
Reg Sel: PA10
*/
#define LCD_CONTROL_PORT  GPIOA
#define LCD_EN            8
#define LCD_RW            9
#define LCDRS             10

void lcd_init() {
  // Enable LCD Control Port
  RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;

  // Enable LCD Data Port
  RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;

  // Setup PA 8, 9, 10 to output with 10 MHz speed
  GPIOA->CRH = 0b000100010001;

  // Setup PB8-PB15 as output with 10 MHz speed
  // CNF/MODE bits are in word pairs: CNF1,CNF0,MODE1,MODE0 * 8 = 32 bits
  GPIOB->CRH = 0b00010001000100010001000100010001;
}

void delay(int timeDelay) {
  for (int i = 0; i < timeDelay; i++) {}
}

void enableWrite() {
  LCD_CONTROL_PORT->BSRR &= ~(1 << LCD_RW);
  delay(40000);
}

void enableRead() {
  LCD_CONTROL_PORT->BSRR |= (1 << LCD_RW);
  delay(40000);
}

void commandMode() {
  LCD_CONTROL_PORT->BSRR &= ~(1 << LCD_RS);
  delay(40000);
}

void characterMode() {
  LCD_CONTROL_PORT->BSRR |= (1 << LCD_RS);
  delay(40000);
}

void lcd_send_character(char character) {
  // Toggle EN to 0
  LCD_CONTROL_PORT->BSRR &= ~(1 << LCD_EN);

  delay(80000);


  // Turn on PB8-PB15
  // GPIOB->BSRR = 0b1111111100000000;

  // Send character "A" to PB8-15
  GPIOB->BSRR = character<<8;

  // GPIOA->BSRR = 0b101<<8;
}
