# flutter_marquee_plus

A lightweight and customizable marquee (scrolling text) widget for Flutter.

## Features
- Scrolls only when text overflows
- Adjustable velocity
- Supports animation curves

## Usage

```dart
import 'package:flutter_marquee_plus/flutter_marquee_plus.dart';

MarqueePlus(
  text: 'This is a very long text that scrolls smoothly',
  velocity: 100,
  style: TextStyle(fontSize: 18),
)