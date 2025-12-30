# marquee_plus

A lightweight and customizable marquee (scrolling text) widget for Flutter.

## Features
- Scrolls only when text overflows
- Adjustable velocity
- Optional alwaysScroll mode
- Supports animation curves

## Usage

```dart
MarqueePlus(
  text: 'This is a very long text that scrolls smoothly',
  velocity: 100,
  alwaysScroll: false,
  style: TextStyle(fontSize: 18),
)