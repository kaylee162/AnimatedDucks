#include "gba.h"

// Pointer to the start of video memory
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Draws a rectangle in mode 3
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(x + j, y + i, color);
        }
    }
}

// Fills the screen in mode 3
void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

// Waits until drawing pixel 0 of line 160
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

// Checks for collision between two rectangles
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}
