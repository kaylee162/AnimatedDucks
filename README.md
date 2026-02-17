# Animated Ducks (GBA)

A simple animation demo written in C for the Game Boy Advance using Mode 3 graphics.

## Overview

This program displays a group of ducks that switch between a resting state and an animated state. When animation is active, the ducks reverse their order at timed intervals, creating a looping visual effect.

The animation is controlled by a basic state machine and synchronized using VBlank for smooth rendering.

## Controls

- **START** — Toggle between Rest and Animate states

## Concepts Demonstrated

- GBA Mode 3 graphics
- State machines
- VBlank synchronization
- Input handling
- Struct manipulation with pointers
- Array reversal using swap logic

## File Structure

- `main.c` — Core game loop and state machine
- `duck.c / duck.h` — Duck data and drawing logic
- `text.c / text.h` — Text rendering utilities
- `gba.h` — GBA hardware definitions

---

Built as a practice project for learning GBA development and C programming fundamentals.
