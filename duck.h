#define DUCKLEN 16
#define DUCKCOUNT 5

// Duck struct
typedef struct {
	int* bitmap;
	unsigned short color;
} DUCK;

extern DUCK ducks[DUCKCOUNT];
extern int* duckBitmaps[DUCKCOUNT];

// Prototypes
void initializeDucks();
void drawDuck(DUCK* duck_ptr, int index);