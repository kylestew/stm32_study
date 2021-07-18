#include "TM1637.h"

#include <string.h>

void delayUS(uint16_t us) {
  for (uint16_t i = 0; i < us; i++) { asm("nop"); }
}

// store an ASCII Map in PROGMEM (Flash memory)
const uint8_t asciiMap[96] = {
  TM1637_CHAR_SPACE,
  TM1637_CHAR_EXC,
  TM1637_CHAR_D_QUOTE,
  TM1637_CHAR_POUND,
  TM1637_CHAR_DOLLAR,
  TM1637_CHAR_PERC,
  TM1637_CHAR_AMP,
  TM1637_CHAR_S_QUOTE,
  TM1637_CHAR_L_BRACKET,
  TM1637_CHAR_R_BRACKET,
  TM1637_CHAR_STAR,
  TM1637_CHAR_PLUS,
  TM1637_CHAR_COMMA,
  TM1637_CHAR_MIN,
  TM1637_CHAR_DOT,
  TM1637_CHAR_F_SLASH,
  TM1637_CHAR_0,          // 48 (ASCII)
  TM1637_CHAR_1,
  TM1637_CHAR_2,
  TM1637_CHAR_3,
  TM1637_CHAR_4,
  TM1637_CHAR_5,
  TM1637_CHAR_6,
  TM1637_CHAR_7,
  TM1637_CHAR_8,
  TM1637_CHAR_9,
  TM1637_CHAR_COLON,
  TM1637_CHAR_S_COLON,
  TM1637_CHAR_LESS,
  TM1637_CHAR_EQUAL,
  TM1637_CHAR_GREAT,
  TM1637_CHAR_QUEST,
  TM1637_CHAR_AT,
  TM1637_CHAR_A,          // 65 (ASCII)
  TM1637_CHAR_B,
  TM1637_CHAR_C,
  TM1637_CHAR_D,
  TM1637_CHAR_E,
  TM1637_CHAR_F,
  TM1637_CHAR_G,
  TM1637_CHAR_H,
  TM1637_CHAR_I,
  TM1637_CHAR_J,
  TM1637_CHAR_K,
  TM1637_CHAR_L,
  TM1637_CHAR_M,
  TM1637_CHAR_N,
  TM1637_CHAR_O,
  TM1637_CHAR_P,
  TM1637_CHAR_Q,
  TM1637_CHAR_R,
  TM1637_CHAR_S,
  TM1637_CHAR_T,
  TM1637_CHAR_U,
  TM1637_CHAR_V,
  TM1637_CHAR_W,
  TM1637_CHAR_X,
  TM1637_CHAR_Y,
  TM1637_CHAR_Z,
  TM1637_CHAR_L_S_BRACKET,  // 91 (ASCII)
  TM1637_CHAR_B_SLASH,
  TM1637_CHAR_R_S_BRACKET,
  TM1637_CHAR_A_CIRCUM,
  TM1637_CHAR_UNDERSCORE,
  TM1637_CHAR_A_GRAVE,       // 96 (ASCII)
  TM1637_CHAR_a,
  TM1637_CHAR_b,
  TM1637_CHAR_c,
  TM1637_CHAR_d,
  TM1637_CHAR_e,
  TM1637_CHAR_f,
  TM1637_CHAR_g,
  TM1637_CHAR_h,
  TM1637_CHAR_i,
  TM1637_CHAR_j,
  TM1637_CHAR_k,
  TM1637_CHAR_l,
  TM1637_CHAR_m,
  TM1637_CHAR_n,
  TM1637_CHAR_o,
  TM1637_CHAR_p,
  TM1637_CHAR_q,
  TM1637_CHAR_r,
  TM1637_CHAR_s,
  TM1637_CHAR_t,
  TM1637_CHAR_u,
  TM1637_CHAR_v,
  TM1637_CHAR_w,
  TM1637_CHAR_x,
  TM1637_CHAR_y,
  TM1637_CHAR_z,
  TM1637_CHAR_L_ACCON,  // 123 (ASCII)
  TM1637_CHAR_BAR,
  TM1637_CHAR_R_ACCON,
  TM1637_CHAR_TILDE     // 126 (ASCII)
};



TM1637::TM1637(int rccPortToEnable, GPIO_TypeDef* portClk, uint8_t pinClk, GPIO_TypeDef* portDIO, uint8_t pinDIO) :
  portClk{portClk},
  pinClk{pinClk},
  portDIO{portDIO},
  pinDIO{pinDIO}
{
  // Global enable Port B
  RCC->APB2ENR |= rccPortToEnable;

  // output (push-pull), 10 MHz = 0001
  if (pinClk > 7) {
    portClk->CRH |= 1<<((pinClk-8)*4);
    portClk->CRH &= ~(1<<((pinClk-8)*4)+1);
    portClk->CRH &= ~(1<<((pinClk-8)*4)+2);
    portClk->CRH &= ~(1<<((pinClk-8)*4)+3);
  } else {
    portClk->CRL |= 1<<(pinClk*4);
    portClk->CRL &= ~(1<<(pinClk*4)+1);
    portClk->CRL &= ~(1<<(pinClk*4)+2);
    portClk->CRL &= ~(1<<(pinClk*4)+3);
  }
  if (pinDIO > 7) {
    portDIO->CRH |= 1<<((pinDIO-8)*4);
    portDIO->CRH &= ~(1<<((pinDIO-8)*4)+1);
    portDIO->CRH &= ~(1<<((pinDIO-8)*4)+2);
    portDIO->CRH &= ~(1<<((pinDIO-8)*4)+3);
  } else {
    portDIO->CRL |= 1<<(pinDIO*4);
    portDIO->CRL &= ~(1<<(pinDIO*4)+1);
    portDIO->CRL &= ~(1<<(pinDIO*4)+2);
    portDIO->CRL &= ~(1<<(pinDIO*4)+3);
  }

  // set both high
  portClk->BSRR |= (1<<pinClk); // CLK high
  portDIO->BSRR |= (1<<pinDIO); // DIO high
}

void TM1637::begin(uint8_t cols) {
  numCols = cols;

  // write command SET_DATA   (Command1) Defaults
  command(
    TM1637_COM_SET_DATA |
    TM1637_SET_DATA_WRITE |
    TM1637_SET_DATA_A_ADDR |
    TM1637_SET_DATA_M_NORM
  );

  clear();
}

void TM1637::clear() {
  uint8_t rawBytes[4] = {0,0,0,0};
  printRaw(rawBytes);
  home();
}

void TM1637::home() {
  setCursor(0);
}

void TM1637::setCursor(uint8_t col) {
  col = (col > TM1637_MAX_COLUMNS - 1) ? TM1637_MAX_COLUMNS - 1 : col;
  cursorPos = col;
}

void TM1637::setBacklight(uint8_t value) {
  value = (value > 100) ? 100 : value; // 0..100 brightness
  backLightValue = value;

  // only 8 levels of brightness
  value /= 10;
  value = (value > 8) ? 8 : value;

  uint8_t cmd = TM1637_COM_SET_DISPLAY;
  switch ( value ) {
    case 0:
      cmd |= TM1637_SET_DISPLAY_OFF;
      break;
    case 1:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_1;
      break;
    case 2:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_2;
      break;
    case 3:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_4;
      break;
    case 4:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_10;
      break;
    case 5:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_11;
      break;
    case 6:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_12;
      break;
    case 7:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_13;
      break;
    case 8:
      cmd |= TM1637_SET_DISPLAY_ON | TM1637_SET_DISPLAY_14;
      break;
    };
    bool ack = command(cmd);
}

void TM1637::setContrast(uint8_t value) {
  setBacklight(value);
}

void TM1637::on(void) {
  setBacklight(TM1637_DEFAULT_BACKLIGHT);
};

void TM1637::off(void) {
  setBacklight(0);
  clear();
};

size_t TM1637::print(uint8_t byte) {
  if (cursorPos == numCols) {
    shiftLeft(rawBuffer, numCols);
    rawBuffer[cursorPos] = encode((char)byte);
    printRaw(rawBuffer, numCols, 0);
  };

  if (cursorPos < numCols) {
    rawBuffer[cursorPos] = encode( (char)byte );
    printRaw(rawBuffer, cursorPos+1, 0);
    setCursor(cursorPos + 1);
  };
}

size_t TM1637::print(const char* str) {
  uint8_t encodedBytes[4];

  encode(encodedBytes, str, 4);
  uint8_t i = 4;
  do {
    printRaw(encodedBytes);
    shiftLeft(encodedBytes, 4);
    encodedBytes[3] = encode(str[i]);
    i++;
    if ( i == TM1637_MAX_CHARS) {
      break;
    }
  }
  while(str[i] != '\0');
}

void TM1637::shiftLeft(uint8_t* buffer, size_t length) {
  for (uint8_t i=0; i < length ; i++) {
    buffer[i] = buffer[i+1];
  }
}

uint8_t TM1637::encode(int16_t d) {
  // can only encode single digit
  if ( d > 9 || d < 0) {
    return 0;
  };
  return asciiMap[d + '0' - ' '];
};

uint8_t TM1637::encode(char c) {
  if ( c < ' ') { // 32 (ASCII)
    return 0;
  }
  return asciiMap[c - ' '];
};

uint8_t TM1637::encode(uint8_t* buffer, const char* str, size_t bufferSize) {
  size_t i;

  for (i = 0; i < bufferSize; i++) {
    if (str[i] == '\0' ) {
      return i;
    }
    buffer[i] = encode(str[i]);
  };
  return i;
}

// == LOW LEVEL ==
void TM1637::printRaw(uint8_t rawByte, uint8_t position) {
  uint8_t cmd[2];
  cmd[0] = TM1637_COM_SET_ADR | position;
  cmd[1] = rawByte;
  // if (position == 1) { cmd[1]|=(_colonOn)?TM1637_COLON_BIT:0; };
  command(cmd, 2);
};

void TM1637::printRaw(const uint8_t* rawBytes, size_t length, uint8_t position) {
  uint8_t cmd[5] = {0, };
  cmd[0] = TM1637_COM_SET_ADR | (position & 0b111);  // sets address
  memcpy(&cmd[1], rawBytes, length);       // copy bytes

  // do we have to print a colon?
  // if ( position < 2 ) { // printing after position 2 has never a colon
  //   if ( position == 0 && length >= 2) {
  //     // second index is the colon
  //     cmd[2] |= (colonOn) ? TM1637_COLON_BIT : 0;
  //   } else {
  //     // first index is the colon
  //     cmd[1] |= (colonOn) ? TM1637_COLON_BIT : 0;
  //   }
  // }
  command(cmd, length + 1);
}

bool TM1637::command(uint8_t cmd) const {
  comStart();
  comWriteByte(cmd);
  bool acknowledged = comAck();
  comStop();
  return acknowledged;
};

bool TM1637::command(const uint8_t* commands, uint8_t length) const {
  bool acknowledged = true;
  comStart();
  for (uint8_t i = 0; i < length; i++) {
    comWriteByte(commands[i]);
    acknowledged &= comAck();
  };
  comStop();
  return acknowledged;
}

void TM1637::comStart() const {
  portDIO->BSRR |= (1<<pinDIO); // DIO high
  portClk->BSRR |= (1<<pinClk); // CLK high
  delayUS(TM1637_CLK_DELAY_US);

  portDIO->BRR |= (1<<pinDIO); // DIO low
}

void TM1637::comWriteByte(uint8_t command) const {
  // CLK in bits
  for (uint8_t i = 0; i < 8; i++) {
    portClk->BRR |= (1<<pinClk); // CLK low

    if (command & 0b1) {
      portDIO->BSRR |= (1<<pinDIO); // DIO low
    } else {
      portDIO->BRR |= (1<<pinDIO); // DIO high
    }
    delayUS(TM1637_CLK_DELAY_US);

    command >>= 1;

    portClk->BSRR |= (1<<pinClk); // CLK high
    delayUS(TM1637_CLK_DELAY_US);
  }
}

void TM1637::comStop(void) const {
  portClk->BRR |= (1<<pinClk); // CLK low
  delayUS(TM1637_CLK_DELAY_US);

  portDIO->BRR |= (1<<pinDIO); // DIO low
  delayUS(TM1637_CLK_DELAY_US);

  portClk->BSRR |= (1<<pinClk); // CLK high
  delayUS(TM1637_CLK_DELAY_US);

  portDIO->BSRR |= (1<<pinDIO); // DIO high
}

bool TM1637::comAck(void) const {
  bool acknowledged = false;

  portClk->BRR |= (1<<pinClk); // CLK low
  // pinAsInputPullUp(pinDIO);    // DIO INPUT PULLUP (state==HIGH)
  delayUS(TM1637_CLK_DELAY_US);

  // acknowledged = isLow(pinDIO);// Ack should pull the pin low again

  portClk->BSRR |= (1<<pinClk); // CLK high
  delayUS(TM1637_CLK_DELAY_US);
  portDIO->BRR |= (1<<pinDIO); // DIO low

  // pinAsOutput(pinDIO);

  return acknowledged;
}
