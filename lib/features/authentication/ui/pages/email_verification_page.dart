import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_pulse/core/constants/routes.dart';
import 'package:project_pulse/core/extensions/string_extensions.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/widgets/primary_elevated_button.dart';

import '../../../../core/path_clippers/wave_clipper.dart';
import '../widgets/verification_code_input.dart';

class EmailVerficiationPage extends StatelessWidget {
  const EmailVerficiationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final email = arguments!['email'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Email Verification'),
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
                      FontAwesomeIcons.envelopeCircleCheck,
                      color: Theme.of(context).colorScheme.primary,
                      size: UIConstants.xLgSize,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: UIConstants.mdSize),
                    child: Text(
                      ' ${'Please enter the 4 Digit code sent to'.lineBreak()} $email',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: TextStyles.boldMin,
                            height: TextStyles.heightMed,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(UIConstants.mdPadding),
                      child: VerificationCodeInput()),
                  const SizedBox(height: UIConstants.lgSize),
                  PrimaryElevatedButton(
                      label: 'Verify',
                      onPressed: () {
                        Navigator.of(context).pushNamed(AuthRoutes.newPassword);
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
