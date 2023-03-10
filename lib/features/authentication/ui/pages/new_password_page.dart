import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_pulse/core/constants/routes.dart';
import 'package:project_pulse/core/extensions/string_extensions.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/widgets/primary_elevated_button.dart';
import 'package:project_pulse/features/authentication/ui/widgets/text_input_with_label.dart';

import '../../../../core/ui/widgets/app_scaffold.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UIConstants.mdPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  UIConstants.mdSize,
                ),
                child: Icon(
                  FontAwesomeIcons.lockOpen,
                  color: Theme.of(context).colorScheme.primary,
                  size: UIConstants.xLgSize,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: UIConstants.mdSize),
                child: Text(
                  '${'Your new password must be different'.lineBreak()}from previously userd password',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: TextStyles.boldMed,
                      height: TextStyles.heightMed),
                  textAlign: TextAlign.center,
                ),
              ),
              TextInputWithLabel(label: 'New Password'),
              const SizedBox(height: UIConstants.xSmSize),
              TextInputWithLabel(label: 'Confirm New Password'),
              const SizedBox(height: UIConstants.lgSize),
              PrimaryElevatedButton(
                  label: 'Change Password',
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        AuthRoutes.emailVerification,
                        arguments: {'email': 'yaza.ma.aamer@gmail.com'});
                  })
            ],
          ),
        ),
      ),
    );
  }
}
