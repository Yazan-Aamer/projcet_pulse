import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_pulse/core/constants/routes.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/widgets/social_media_button.dart';

import '../widgets/primary_elevated_button.dart';
import '../widgets/text_input_with_label.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            debugPrint(FirebaseAuth.instance.currentUser.toString());
            if (snapshot.data != null) {
              return Center(child: Text(snapshot.data!.displayName.toString()));
            } else if (snapshot.data == null) {
              debugPrint('data is null');
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(UIConstants.mdPadding),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: UIConstants.lgPadding),
                      child: Image.asset('assets/logo.png',
                          color: Theme.of(context).colorScheme.primary,
                          colorBlendMode: BlendMode.modulate),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: UIConstants.smPadding),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: UIConstants.smPadding),
                          child: Text('Login to your account',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: UIConstants.smPadding),
                      child: Form(
                        child: Column(
                          children: [
                            TextInputWithLabel(
                              controller: emailController,
                              label: 'Email',
                            ),
                            const SizedBox(
                              height: UIConstants.xSmSize,
                            ),
                            TextInputWithLabel(
                              controller: passwordController,
                              label: 'Password',
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    PrimaryElevatedButton(
                      label: 'Sign in',
                      onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                    const SizedBox(
                      height: UIConstants.mdSize,
                    ),
                    Text(
                      'or sign in using',
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
                    Padding(
                      padding: const EdgeInsets.all(UIConstants.smPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Did you forget your password? click ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ])),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AuthRoutes.forgotPassword);
                            },
                            child: Text(
                              'here',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      decorationColor:
                                          Theme.of(context).colorScheme.primary,
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have an account,',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ])),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AuthRoutes.signup);
                      },
                      child: Text(
                        'sign up'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            decorationColor:
                                Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
