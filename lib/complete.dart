import 'package:flutter/material.dart';

class CompletePg extends StatefulWidget {
  const CompletePg({required Key key}) : super(key: key);

  @override
  State<CompletePg> createState() => _CompletePgState();
}

class _CompletePgState extends State<CompletePg> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('test complete page'),
      ),
    );
  }
}
