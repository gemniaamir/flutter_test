// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:proctor/main.dart';

void main() {
  group("Time", () {
    test('Past', () {
      // Arrange
      DateTime time = DateTime(2024, 1, 1, 1);
      // Act
      bool pastTime = time.isBefore(DateTime.now());
      String result = pastTime ? 'Past time' : 'Future Time';
      // Assert
      expect(result, "Past time");
    });
  });

  testWidgets('Find Text', (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(const MyApp());

    expect(find.text('Dash'), findsNothing);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
