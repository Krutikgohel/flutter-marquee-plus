import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_marquee_plus/flutter_marquee_plus.dart';

import '../example/main.dart';

void main() {
  testWidgets('MarqueePlus smoke test', (WidgetTester tester) async {
    // Increase viewport size to ensure all items in ListView are built
    tester.view.physicalSize = const Size(1000, 2000);
    tester.view.devicePixelRatio = 1.0;
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we have MarqueePlus widgets.
    expect(find.byType(MarqueePlus), findsWidgets);

    // Verify specific text presence
    expect(find.text('1. Horizontal (Short vs Long)'), findsOneWidget);
    expect(find.text('2. Vertical (Short vs Long)'), findsOneWidget);
    expect(find.text('3. Force Scroll (H & V)'), findsOneWidget);
  });
}
