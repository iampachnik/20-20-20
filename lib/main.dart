import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'widgets/background.dart';
import 'screens/left_content.dart';
import 'screens/right_content.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (const bool.fromEnvironment('dart.library.js_util')) {
  }

  await WindowManager.instance.ensureInitialized();
  await WindowManager.instance.setMinimumSize(const Size(1100, 700));
  await WindowManager.instance.setMaximumSize(const Size(1100, 700));
  await WindowManager.instance.setResizable(false);
  await WindowManager.instance.setMinimizable(false);
  await WindowManager.instance.setMaximizable(false);
  await WindowManager.instance.setSize(const Size(1100, 700));
  await WindowManager.instance.center();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '20-20-20',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLeftActive = true;
  bool isRightActive = false;

  void toggleLeftActive() {
    setState(() {
      isLeftActive = !isLeftActive;
    });
  }

  void toggleRightActive() {
    setState(() {
      isRightActive = !isRightActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          MainBackground(
            leftChild: LeftContent(
              isActive: isLeftActive,
              toggleActive: toggleLeftActive,
            ),
            rightChild: RightContent(
              isActive: isRightActive,
              toggleActive: toggleRightActive,
            ),
          ),
        ],
      ),
    );
  }
}