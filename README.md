# Flutter Marquee Plus 🚀

[![Pub Version](https://img.shields.io/pub/v/flutter_marquee_plus?style=flat-square&color=blue)](https://pub.dev/packages/flutter_marquee_plus)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Pub Points](https://img.shields.io/pub/points/flutter_marquee_plus?style=flat-square&color=green)](https://pub.dev/packages/flutter_marquee_plus)

A **silky smooth**, **highly customizable**, and **lightweight** Marquee widget for Flutter.
Supports **horizontal & vertical scrolling**, **custom animations**, and **dynamic pausing**.

---

![Marquee demo](https://raw.githubusercontent.com/Krutikgohel/flutter-marquee-plus/main/assets/demo.gif)

## ✨ Features

- 🌊 **Smooth Sailing**: Silky smooth scrolling animation.
- 📐 **Flexible Directions**: Supports both Horizontal and Vertical scrolling.
- 🎯 **Precise Control**: Customize velocity, acceleration, and deceleration.
- ⏸️ **Smart Pausing**: Option to pause after each round.
- ⚡ **Auto-Start**: Automatically scrolls only when text overflows (optional).
- 🌪️ **Force Scroll**: Scroll text continuously even if it fits within the container.
- 🎨 **Styling**: Full control over text style, alignment, and gaps.
- 📏 **Cross-Axis Alignment**: Align text to Start, Center, or End.

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_marquee_plus: ^latest_version
```

## 🚀 Usage

### Simple Example

```dart
import 'package:flutter_marquee_plus/flutter_marquee_plus.dart';

MarqueePlus(
  text: 'Simple smooth scrolling text...',
  velocity: 50.0,
)
```

### Advanced Example

```dart
MarqueePlus(
  text: 'Forced Scroll with Acceleration & Deceleration',
  forceScroll: true,
  velocity: 50.0,
  gap: 20.0,
  scrollAxis: Axis.horizontal,
  crossAxisAlignment: CrossAxisAlignment.start,
  padding: EdgeInsets.all(8.0),
  pauseAfterRound: Duration(seconds: 1),
  accelerationDuration: Duration(seconds: 1),
  decelerationDuration: Duration(milliseconds: 500),
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

## 🔧 Attributes

| Attribute | Type | Default | Description |
|---|---|---|---|
| `text` | `String` | **Required** | The text to be displayed. |
| `style` | `TextStyle?` | `null` | Style for the text. |
| `velocity` | `double` | `50.0` | Scroll speed in pixels per second. |
| `gap` | `double` | `65.0` | Space between text instances. |
| `scrollAxis` | `Axis` | `Axis.horizontal` | Direction to scroll (horizontal/vertical). |
| `crossAxisAlignment` | `CrossAxisAlignment?` | `start` | Alignment along the cross axis (e.g. Top for horizontal). |
| `textAlign` | `TextAlign` | `start` | Text alignment within the item. |
| `forceScroll` | `bool` | `false` | Scroll even if text fits content. |
| `pauseAfterRound` | `Duration` | `Duration.zero` | Wait time after each scroll cycle. |
| `accelerationDuration`| `Duration` | `Duration.zero` | Duration to reach full speed. |
| `decelerationDuration`| `Duration` | `Duration.zero` | Duration to slow down before stopping. |
| `padding` | `EdgeInsetsGeometry`| `EdgeInsets.zero`| Padding around the text. |
| `curve` | `Curve?` | `null` | Custom animation curve. |
