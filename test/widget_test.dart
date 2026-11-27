import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_planner/main.dart';

void main() {
  testWidgets('App builds and shows Home with bottom navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const StudentPlannerApp());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Tasks'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Progress'), findsOneWidget);
    expect(find.text('Jannatul Ferdous Suzane'), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);

    // Switch to the Tasks tab.
    await tester.tap(find.text('Tasks'));
    await tester.pumpAndSettle();
    expect(find.text('Search tasks, courses...'), findsOneWidget);
  });
}
