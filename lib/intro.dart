import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({required Key key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('test into page'),
      ),
    );
  }
}
