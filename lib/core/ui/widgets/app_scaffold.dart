import 'package:flutter/material.dart';

import '../path_clippers/wave_clipper.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, required this.child});
  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool _isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final keyboardBottom = MediaQuery.of(context).viewInsets.bottom;
    if (keyboardBottom == 0) {
      _isKeyboardVisible = false;
    } else {
      _isKeyboardVisible = true;
    }
    debugPrint(_isKeyboardVisible.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              // hide the wave
              height: _isKeyboardVisible ? 0 : double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(.1),
                    Theme.of(context).colorScheme.secondary.withOpacity(.1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
