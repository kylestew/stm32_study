#ifndef TM1637_H
#define TM1637_H

#include "stm32f1xx.h"

#define TM1637_DEFAULT_BACKLIGHT    100

#define TM1637_MAX_COLUMNS          4
#define TM1637_MAX_CHARS            128

#define TM1637_CLK_DELAY_US         5


// COMMANDS
#define TM1637_COM_SET_DATA     0b01000000 // 0x40 (1) Data set
#define TM1637_COM_SET_ADR      0b11000000 // 0xC0 (2) Address command set
#define TM1637_COM_SET_DISPLAY  0b10000000 // 0x80 (3) Display control command set

// Data set (1) (use logical OR to contruct complete command)
#define TM1637_SET_DATA_WRITE   0b00000000 // Write data to the display register
#define TM1637_SET_DATA_READ    0b00000010 // Read the key scan data
#define TM1637_SET_DATA_A_ADDR  0b00000000 // Automatic address increment
#define TM1637_SET_DATA_F_ADDR  0b00000100 // Fixed address
#define TM1637_SET_DATA_M_NORM  0b00000000 // Normal mode
#define TM1637_SET_DATA_M_TEST  0b00100000 // Test mode

// Address settings (2) (use logical OR to contruct complete command)
#define TM1637_SET_ADR_00H      0b0000000  // addr 00
#define TM1637_SET_ADR_01H      0b0000001  // addr 01
#define TM1637_SET_ADR_02H      0b0000010  // addr 02
#define TM1637_SET_ADR_03H      0b0000011  // addr 03
#define TM1637_SET_ADR_04H      0b0000100  // addr 04 (only TM1637)
#define TM1637_SET_ADR_05H      0b0000101  // addr 05 (only TM1637)
// The command is used to set the display register address; if the address is set to 0C4H or higher, the data is ignored, until the effective address is set; when the power is on, the default is set to 00H address.

// Display control command set (use logical OR to consruct complete command)
#define TM1637_SET_DISPLAY_1    0b0000000  // Pulse width 1/16 (0.0625) (0)
#define TM1637_SET_DISPLAY_2    0b0000001  // Pulse width 2/16 (0.0625) (1)
#define TM1637_SET_DISPLAY_4    0b0000010  // Pulse width 4/16 (0.0625) (2)
#define TM1637_SET_DISPLAY_10   0b0000011  // Pulse width 10/16 (0.0625) (3)
#define TM1637_SET_DISPLAY_11   0b0000100  // Pulse width 11/16 (0.0625) (4)
#define TM1637_SET_DISPLAY_12   0b0000101  // Pulse width 12/16 (0.0625) (5)
#define TM1637_SET_DISPLAY_13   0b0000110  // Pulse width 13/16 (0.0625) (6)
#define TM1637_SET_DISPLAY_14   0b0000111  // Pulse width 14/16 (0.0625) (7)
#define TM1637_SET_DISPLAY_OFF  0b0000000  // OFF
#define TM1637_SET_DISPLAY_ON   0b0001000  // ON
// there are a total of 8 brighness values, plus off

#define TM1637_COLON_BIT        0b10000000


class TM1637 {
public:
  TM1637(int rccPortToEnable, GPIO_TypeDef* portClk, uint8_t pinClk, GPIO_TypeDef* portDIO, uint8_t pinDIO);

  void begin(uint8_t cols = TM1637_MAX_COLUMNS);

  void clear();
  void home();
  void setCursor(uint8_t position);
  void setBacklight(uint8_t value);
  void setContrast(uint8_t value);
  void on();
  void off();

  size_t print(uint8_t byte);
  size_t print(const char* str);

private:
  GPIO_TypeDef* portClk;
  GPIO_TypeDef* portDIO;
  uint8_t pinClk;
  uint8_t pinDIO;

  uint8_t numCols;
  uint8_t cursorPos;
  uint8_t backLightValue;
  uint8_t colonOn;
  uint8_t rawBuffer[TM1637_MAX_COLUMNS];

  uint8_t encode(int16_t c);
  uint8_t encode(char c);
  uint8_t encode(uint8_t* buffer, const char* str, size_t bufferSize);
  void shiftLeft(uint8_t* buffer, size_t length);

  // == LOW LEVEL ==
  void printRaw(const uint8_t* rawBytes, size_t length = 4, uint8_t position = 0);
  void printRaw(uint8_t rawByte, uint8_t position);

  bool command(uint8_t cmd) const;
  bool command(const uint8_t* command, uint8_t length) const;

  void comWriteByte(uint8_t command) const;
  void comStart(void) const;
  void comStop(void) const;
  bool comAck(void) const;

};


// ASCII MAPPINGS
#define TM1637_CHAR_SPACE       0b00000000 // 32  (ASCII)
#define TM1637_CHAR_EXC         0b00000110
#define TM1637_CHAR_D_QUOTE     0b00100010
#define TM1637_CHAR_POUND       0b01110110
#define TM1637_CHAR_DOLLAR      0b01101101
#define TM1637_CHAR_PERC        0b00100100
#define TM1637_CHAR_AMP         0b01111111
#define TM1637_CHAR_S_QUOTE     0b00100000
#define TM1637_CHAR_L_BRACKET   0b00111001
#define TM1637_CHAR_R_BRACKET   0b00001111
#define TM1637_CHAR_STAR        0b01011100
#define TM1637_CHAR_PLUS        0b01010000
#define TM1637_CHAR_COMMA       0b00010000
#define TM1637_CHAR_MIN         0b01000000
#define TM1637_CHAR_DOT         0b00001000
#define TM1637_CHAR_F_SLASH     0b00000110
#define TM1637_CHAR_0           0b00111111   // 48
#define TM1637_CHAR_1           0b00000110
#define TM1637_CHAR_2           0b01011011
#define TM1637_CHAR_3           0b01001111
#define TM1637_CHAR_4           0b01100110
#define TM1637_CHAR_5           0b01101101
#define TM1637_CHAR_6           0b01111101
#define TM1637_CHAR_7           0b00000111
#define TM1637_CHAR_8           0b01111111
#define TM1637_CHAR_9           0b01101111
#define TM1637_CHAR_COLON       0b00110000
#define TM1637_CHAR_S_COLON     0b00110000
#define TM1637_CHAR_LESS        0b01011000
#define TM1637_CHAR_EQUAL       0b01001000
#define TM1637_CHAR_GREAT       0b01001100
#define TM1637_CHAR_QUEST       0b01010011
#define TM1637_CHAR_AT          0b01011111
#define TM1637_CHAR_A           0b01110111 // 65  (ASCII)
#define TM1637_CHAR_B           0b01111111
#define TM1637_CHAR_C           0b00111001
#define TM1637_CHAR_D           TM1637_CHAR_d
#define TM1637_CHAR_E           0b01111001
#define TM1637_CHAR_F           0b01110001
#define TM1637_CHAR_G           0b00111101
#define TM1637_CHAR_H           0b01110110
#define TM1637_CHAR_I           0b00000110
#define TM1637_CHAR_J           0b00001110
#define TM1637_CHAR_K           0b01110101
#define TM1637_CHAR_L           0b00111000
#define TM1637_CHAR_M           0b00010101
#define TM1637_CHAR_N           0b00110111
#define TM1637_CHAR_O           0b00111111
#define TM1637_CHAR_P           0b01110011
#define TM1637_CHAR_Q           0b01100111
#define TM1637_CHAR_R           0b00110011
#define TM1637_CHAR_S           0b01101101
#define TM1637_CHAR_T           TM1637_CHAR_t
#define TM1637_CHAR_U           0b00111110
#define TM1637_CHAR_V           0b00011100
#define TM1637_CHAR_W           0b00101010
#define TM1637_CHAR_X           TM1637_CHAR_H
#define TM1637_CHAR_Y           0b01101110
#define TM1637_CHAR_Z           0b01011011
#define TM1637_CHAR_L_S_BRACKET 0b00111001 // 91 (ASCII)
#define TM1637_CHAR_B_SLASH     0b00110000
#define TM1637_CHAR_R_S_BRACKET 0b00001111
#define TM1637_CHAR_A_CIRCUM    0b00010011
#define TM1637_CHAR_UNDERSCORE  0b00001000
#define TM1637_CHAR_A_GRAVE     0b00010000
#define TM1637_CHAR_a           0b01011111 // 97 (ASCII)
#define TM1637_CHAR_b           0b01111100
#define TM1637_CHAR_c           0b01011000
#define TM1637_CHAR_d           0b01011110
#define TM1637_CHAR_e           0b01111011
#define TM1637_CHAR_f           TM1637_CHAR_F
#define TM1637_CHAR_g           0b01101111
#define TM1637_CHAR_h           0b01110100
#define TM1637_CHAR_i           0b00000100
#define TM1637_CHAR_j           0b00001100
#define TM1637_CHAR_k           TM1637_CHAR_K
#define TM1637_CHAR_l           0b00110000
#define TM1637_CHAR_m           TM1637_CHAR_M
#define TM1637_CHAR_n           0b01010100
#define TM1637_CHAR_o           0b01011100
#define TM1637_CHAR_p           TM1637_CHAR_P
#define TM1637_CHAR_q           TM1637_CHAR_Q
#define TM1637_CHAR_r           0b01010000
#define TM1637_CHAR_s           TM1637_CHAR_S
#define TM1637_CHAR_t           0b01111000
#define TM1637_CHAR_u           0b00011100
#define TM1637_CHAR_v           0b00011100
#define TM1637_CHAR_w           TM1637_CHAR_W
#define TM1637_CHAR_x           TM1637_CHAR_X
#define TM1637_CHAR_y           0b01100110
#define TM1637_CHAR_z           TM1637_CHAR_Z
#define TM1637_CHAR_L_ACCON     0b01111001 // 123 (ASCII)
#define TM1637_CHAR_BAR         0b00000110
#define TM1637_CHAR_R_ACCON     0b01001111
#define TM1637_CHAR_TILDE       0b01000000 // 126 (ASCII)



#endif
