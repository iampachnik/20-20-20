import 'package:flutter_test/flutter_test.dart';

import 'package:_20_20_20/main.dart';

void main() {
  testWidgets('shows left and right content sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('20-20-20'), findsOneWidget);
    expect(find.text('Take a 20-second break'), findsOneWidget);
  });
}
