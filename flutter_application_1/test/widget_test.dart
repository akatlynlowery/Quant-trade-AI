import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Quant app opens and logs in', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('QuantTrade AI'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Portfolio Value'), findsOneWidget);
    expect(find.text('Browse Paper Trades'), findsOneWidget);
  });
}
