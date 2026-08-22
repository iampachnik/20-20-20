import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:_20_20_20/main.dart';
import 'package:_20_20_20/screens/right_content.dart';

void main() {
  testWidgets('shows left and right content sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('20-20-20'), findsOneWidget);
    expect(find.text('Take a 20-second break'), findsOneWidget);
  });

  testWidgets('hours and minutes use separate controllers', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RightContent(isActive: true),
      ),
    );

    final textFields = tester.widgetList<TextField>(find.byType(TextField)).toList();

    expect(textFields, hasLength(2));
    expect(textFields[0].controller, isNotNull);
    expect(textFields[1].controller, isNotNull);
    expect(textFields[0].controller, isNot(same(textFields[1].controller)));
  });
}
