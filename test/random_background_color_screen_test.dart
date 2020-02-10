import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_random_background/service/random.dart';
import 'package:flutter_random_background/view/random_background_color_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRandomService extends Mock implements RandomService {}

void main() async {
  RandomService randomService;
  setUp(() {
    randomService = MockRandomService();
  });

  testWidgets('page loaded', (WidgetTester tester) async {
    await tester.pumpWidget(TestRandomBackgroundColorScreen(randomService));

    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets(
      'user clicks anywhere on the screen '
      'and the background color changes to a random color',
      (WidgetTester tester) async {
    await tester.pumpWidget(TestRandomBackgroundColorScreen(randomService));

    Color firstColor = Colors.pink;
    when(randomService.randomColor()).thenReturn(firstColor);

    await tester.tap(find.byKey(Key(KEY_GESTURE_DETECTOR)));
    await tester.pump();

    final firstBackground =
        tester.widget(find.byKey(Key(KEY_CONTAINER))) as Container;
    expect((firstBackground.decoration as BoxDecoration).color, firstColor);

    Color secondColor = Colors.green;
    when(randomService.randomColor()).thenReturn(secondColor);

    await tester.tap(find.byKey(Key('gestureDetector')));
    await tester.pump();

    final secondBackground =
        tester.widget(find.byKey(Key('container'))) as Container;
    expect((secondBackground.decoration as BoxDecoration).color, secondColor);

    verify(randomService.randomColor()).called(5);
    verifyNoMoreInteractions(randomService);
  });
}

class TestRandomBackgroundColorScreen extends StatelessWidget {
  final RandomService _randomService;

  const TestRandomBackgroundColorScreen(
    this._randomService, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: RandomBackgroundColorScreen(
        randomService: _randomService,
      )),
    );
  }
}
