# 0 "text.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i=0; i<6; i++) {
        for (int j=0; j<8; j++) {
            if (fontdata_6x8[48 * ch + i + 6 * j]){
                (videoBuffer[((y + j) * (240) + (x + i))] = color);
            }
        }
    }
}


void drawString(int x, int y, char *str, unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }

}
