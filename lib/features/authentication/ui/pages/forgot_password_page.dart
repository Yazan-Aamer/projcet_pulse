import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_pulse/core/extensions/string_extensions.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/widgets/primary_elevated_button.dart';
import 'package:project_pulse/features/authentication/ui/widgets/text_input_with_label.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(UIConstants.mdPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      UIConstants.smSize,
                      UIConstants.mdSize,
                      UIConstants.mdSize,
                      UIConstants.mdSize,
                    ),
                    child: Icon(
                      FontAwesomeIcons.userLock,
                      color: Theme.of(context).colorScheme.primary,
                      size: UIConstants.xLgSize,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: UIConstants.mdSize),
                    child: Text(
                      '${'Please enter your email adress to'.lineBreak()}send you verification code',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextInputWithLabel(label: 'Enter your email'),
                  const SizedBox(height: UIConstants.lgSize),
                  PrimaryElevatedButton(label: 'Send', onPressed: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    const delta = 40;
    final height = size.height - 90;

    const double startingX = 0;
    final startingY = height;

    final double middleX = size.width / 2;
    final double middleY = height;

    final double finalX = size.width;
    final double finalY = height + 40;

    final double firstControlPointX = size.width / 4;
    final double firstControlPointY = height - delta;

    final double secondControlPointX = (3 * size.width) / 4;
    final double secondControlPointY = height + delta;

    final double bottomRightX = size.width;
    final double bottomRightY = size.height;

    const double bottomLeftX = 0;
    final double bottomLeftY = size.height;

    path.lineTo(
        startingX, startingY); // flipped from path.lineTo(0, size.height);

    path.quadraticBezierTo(
        firstControlPointX, firstControlPointY, middleX, middleY);

    path.quadraticBezierTo(secondControlPointX, secondControlPointY, finalX,
        finalY); // flipped from size.height

    path.lineTo(bottomRightX, bottomRightY);
    path.lineTo(bottomLeftX, bottomLeftY);
    path.lineTo(startingX, startingY);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
