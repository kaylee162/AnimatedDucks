# 0 "gba.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 55 "gba.h"
extern volatile unsigned short* videoBuffer;





void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile u16);
void waitForVBlank();
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 80 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;


void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            (videoBuffer[((y + i) * (240) + (x + j))] = color);
        }
    }
}


void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}


void waitForVBlank() {
    while ((*(volatile unsigned short *) 0x04000006) >= 160);
    while ((*(volatile unsigned short *) 0x04000006) < 160);
}


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}
