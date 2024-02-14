import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/data_storage.dart';
import 'data/theme_data.dart';
import 'screens/questions_screen.dart';
import 'screens/results_screen.dart';
import 'screens/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MaterialApp(
        darkTheme: kDarkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const RootWidget(),
      ),
    );
  });
}

class RootWidget extends StatefulWidget {
  const RootWidget({
    super.key,
  });

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  ///
  List<String> _selectedAnswers = [];
  String _activeScreenName = 'startScreenName';

  @override
  Widget build(BuildContext context) {
    Widget currentScreenWidget = _buildCurrentScreenWidget();

    return CupertinoPageScaffold(
      child: currentScreenWidget,
    );
  }

  Widget _buildCurrentScreenWidget() {
    Widget currentScreenWidget = _activeScreenName == 'startScreenName'
        ? StartScreen(_switchToQuestionsScreen)
        : _buildNonStartScreen();

    return currentScreenWidget;
  }

  Widget _buildNonStartScreen() {
    return _activeScreenName == 'questionsScreenName'
        ? QuestionsScreen(onSelectAnswer: _chooseAnswer)
        : ResultsScreen(
            chosenAnswers: _selectedAnswers,
            onRestart: restartQuiz,
          );
  }

// methods are next:
  void _switchToQuestionsScreen() {
    setState(() {
      _activeScreenName = 'questionsScreenName';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == qAnswers.length) {
      setState(() {
        _activeScreenName = 'resultsScreenName';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreenName = 'questionsScreenName';
    });
  }
}
