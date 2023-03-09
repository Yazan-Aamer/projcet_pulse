import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_pulse/core/constants/routes.dart';
import 'package:project_pulse/core/extensions/string_extensions.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/widgets/primary_elevated_button.dart';
import 'package:project_pulse/features/authentication/ui/widgets/text_input_with_label.dart';

import '../../../../core/path_clippers/wave_clipper.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  PrimaryElevatedButton(
                      label: 'Send',
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            AuthRoutes.emailVerification,
                            arguments: {'email': 'yaza.ma.aamer@gmail.com'});
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
