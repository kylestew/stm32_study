#include <Adafruit_GFX.h>
#include <Adafruit_SharpMem.h>
#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>

// PINOUT (MCU <--> DISPLAY)
// https://learn.adafruit.com/adafruit-sharp-memory-display-breakout/wiring
// 5v REG --- VIN
// GND --- GND
// ??? --- ???
// ??? --- ???
// ??? --- ???

// any pins can be used
#define SHARP_SCK PA5
#define SHARP_MOSI PA7
#define SHARP_SS PA4

Adafruit_SharpMem display(SHARP_SCK, SHARP_MOSI, SHARP_SS, 400, 240);

int minorHalfSize;  // 1/2 of lesser of display width or height

#define BLACK 0
#define WHITE 1

void setup() {
    display.begin();
    display.clearDisplay();
}

void testdrawline() {
    for (int i = 0; i < display.width(); i += 4) {
        display.drawLine(0, 0, i, display.height() - 1, BLACK);
        display.refresh();
    }
    for (int i = 0; i < display.height(); i += 4) {
        display.drawLine(0, 0, display.width() - 1, i, BLACK);
        display.refresh();
    }
    delay(250);

    display.clearDisplay();
    for (int i = 0; i < display.width(); i += 4) {
        display.drawLine(0, display.height() - 1, i, 0, BLACK);
        display.refresh();
    }
    for (int i = display.height() - 1; i >= 0; i -= 4) {
        display.drawLine(0, display.height() - 1, display.width() - 1, i, BLACK);
        display.refresh();
    }
    delay(250);

    display.clearDisplay();
    for (int i = display.width() - 1; i >= 0; i -= 4) {
        display.drawLine(display.width() - 1, display.height() - 1, i, 0, BLACK);
        display.refresh();
    }
    for (int i = display.height() - 1; i >= 0; i -= 4) {
        display.drawLine(display.width() - 1, display.height() - 1, 0, i, BLACK);
        display.refresh();
    }
    delay(250);

    display.clearDisplay();
    for (int i = 0; i < display.height(); i += 4) {
        display.drawLine(display.width() - 1, 0, 0, i, BLACK);
        display.refresh();
    }
    for (int i = 0; i < display.width(); i += 4) {
        display.drawLine(display.width() - 1, 0, i, display.height() - 1, BLACK);
        display.refresh();
    }
    delay(250);
}

void testdrawrect(void) {
    for (int i = 0; i < minorHalfSize; i += 2) {
        display.drawRect(i, i, display.width() - 2 * i, display.height() - 2 * i, BLACK);
        display.refresh();
    }
}

void testfillrect(void) {
    uint8_t color = BLACK;
    for (int i = 0; i < minorHalfSize; i += 3) {
        // alternate colors
        display.fillRect(i, i, display.width() - i * 2, display.height() - i * 2, color & 1);
        display.refresh();
        color++;
    }
}

void testdrawchar(void) {
    display.setTextSize(1);
    display.setTextColor(BLACK);
    display.setCursor(0, 0);
    display.cp437(true);

    for (int i = 0; i < 256; i++) {
        if (i == '\n') continue;
        display.write(i);
    }
    display.refresh();
}

void loop() {
    // start & clear the display
    display.begin();
    display.clearDisplay();

    // Several shapes are drawn centered on the screen.  Calculate 1/2 of
    // lesser of display width or height, this is used repeatedly later.
    minorHalfSize = min(display.width(), display.height()) / 2;

    testdrawline();
    delay(500);
    display.clearDisplay();
    delay(500);

    // draw rectangles
    testdrawrect();
    delay(500);
    display.clearDisplay();

    // draw multiple rectangles
    testfillrect();
    display.refresh();
    delay(500);
    display.clearDisplay();

    testdrawchar();
    display.refresh();
    for (int i = 0; i < 4; i++) {
        display.refresh();
        delay(500);
    }
}