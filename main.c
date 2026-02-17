#include "gba.h"
#include "duck.h"
#include "text.h"

// Variables
u16 buttons;
u16 oldButtons;
int frameCounter;

// State enum
enum STATE {REST, ANIMATE} state;

// Prototypes
void initialize();
void updateGame();
void drawGame();
void reverseDucks();

// State transition function prototypes 
void goToRest();
void goToAnimate();

// Function prototype for the swap function
void swap(DUCK* duck1, DUCK* duck2);


int main() {
    // First, set up
    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State Machine
        switch (state) {
            case REST:
            // Not doing anything, no game logic changing
                waitForVBlank();
                drawGame();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToAnimate();
                }
                break;
            case ANIMATE:
            // Game logic needs to update
                updateGame();
                waitForVBlank();
                drawGame();
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToRest();
                }
                break;
        }        
    }
}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    // Initally call goToRest
    goToRest();
    

    frameCounter = 0;
    initializeDucks();
}

// State transition functions
void goToRest(){
    state = REST;
    drawRectangle(20,16,18*6,8, BLACK);
    drawString(20,16, "Resting Ducks", BLUE);
}

void goToAnimate() {
    state = ANIMATE;
    drawRectangle(20,16,18*6,8, BLACK);
    drawString(20,16, "Animated Ducks", GRASSGREEN);
}

void updateGame() {
    // Animates ducks so they are constantly swapping
    frameCounter++;
    if (frameCounter == 25) {
        frameCounter = 0;
        reverseDucks();
    }
}

void drawGame() {
    for (int i = 0; i < DUCKCOUNT; i++) {
            drawDuck(&ducks[i], i);
        }
}

void reverseDucks() {
    // Implement method, by calling a helper method called swap
    for (int i=0; i<DUCKCOUNT / 2; i++) {
        swap(&ducks[i], &ducks[DUCKCOUNT-i-1]);
    }
}

// Swap for two ducks
void swap(DUCK* duck1, DUCK* duck2) {
    DUCK temp = *duck1;
    *duck1 = *duck2;
    *duck2 = temp;
}