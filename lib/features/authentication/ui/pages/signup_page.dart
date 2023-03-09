import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/widgets/social_media_button.dart';

import '../../../../core/constants/routes.dart';
import '../widgets/primary_elevated_button.dart';
import '../widgets/text_input_with_label.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: UIConstants.mdPadding,
            right: UIConstants.mdPadding,
            bottom: UIConstants.mdPadding,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: UIConstants.lgSize,
                  child: Image.asset('assets/logo.png',
                      color: Theme.of(context).colorScheme.primary,
                      colorBlendMode: BlendMode.modulate),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: UIConstants.smPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: UIConstants.smPadding),
                    child: Text('Create your account',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: UIConstants.smPadding),
                child: Form(
                  child: Column(
                    children: [
                      TextInputWithLabel(
                        label: 'Email',
                      ),
                      const SizedBox(
                        height: UIConstants.xSmSize,
                      ),
                      TextInputWithLabel(
                        label: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: UIConstants.xSmSize,
                      ),
                      TextInputWithLabel(
                        label: 'Confirm password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryElevatedButton(
                label: 'Sign up',
                onPressed: () {},
              ),
              const SizedBox(
                height: UIConstants.mdSize,
              ),
              Text(
                'or sign up using',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: UIConstants.smPadding,
                  bottom: UIConstants.lgPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SocialMediaButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () {},
                    ),
                    SocialMediaButton(
                      icon: FontAwesomeIcons.google,
                      onPressed: () {},
                    ),
                    SocialMediaButton(
                      icon: FontAwesomeIcons.twitter,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Already have an account, ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AuthRoutes.login);
                },
                child: Text(
                  'sign in',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decorationColor: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
