# 0 "main.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "duck.h" 1




typedef struct {
 int* bitmap;
 unsigned short color;
} DUCK;

extern DUCK ducks[5];
extern int* duckBitmaps[5];


void initializeDucks();
void drawDuck(DUCK* duck_ptr, int index);
# 3 "main.c" 2
# 1 "text.h" 1

void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 4 "main.c" 2


u16 buttons;
u16 oldButtons;
int frameCounter;


enum STATE {REST, ANIMATE} state;


void initialize();
void updateGame();
void drawGame();
void reverseDucks();


void goToRest();
void goToAnimate();


void swap(DUCK* duck1, DUCK* duck2);


int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state) {
            case REST:

                waitForVBlank();
                drawGame();
                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
                    goToAnimate();
                }
                break;
            case ANIMATE:

                updateGame();
                waitForVBlank();
                drawGame();
                if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
                    goToRest();
                }
                break;
        }
    }
}


void initialize() {
    (*(volatile unsigned short *) 0x04000000) = ((3) & 7) | (1 << (8 + (2 & 15)));


    goToRest();


    frameCounter = 0;
    initializeDucks();
}


void goToRest(){
    state = REST;
    drawRectangle(20,16,18*6,8, 0);
    drawString(20,16, "Resting Ducks", (((0) & 31) | (((0) & 31) << 5) | (((31) & 31) << 10)));
}

void goToAnimate() {
    state = ANIMATE;
    drawRectangle(20,16,18*6,8, 0);
    drawString(20,16, "Animated Ducks", (((15) & 31) | (((25) & 31) << 5) | (((0) & 31) << 10)));
}

void updateGame() {

    frameCounter++;
    if (frameCounter == 25) {
        frameCounter = 0;
        reverseDucks();
    }
}

void drawGame() {
    for (int i = 0; i < 5; i++) {
            drawDuck(&ducks[i], i);
        }
}

void reverseDucks() {

    for (int i=0; i<5 / 2; i++) {
        swap(&ducks[i], &ducks[5 -i-1]);
    }
}


void swap(DUCK* duck1, DUCK* duck2) {
    DUCK temp = *duck1;
    *duck1 = *duck2;
    *duck2 = temp;
}
