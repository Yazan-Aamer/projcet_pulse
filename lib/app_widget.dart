import 'package:flutter/material.dart';
import 'package:project_pulse/core/ui/themes.dart';
import 'package:project_pulse/features/authentication/ui/pages/email_verification_page.dart';
import 'package:project_pulse/features/authentication/ui/pages/forgot_password_page.dart';
import 'package:project_pulse/features/authentication/ui/pages/login_page.dart';
import 'package:project_pulse/features/authentication/ui/pages/new_password_page.dart';
import 'package:project_pulse/features/authentication/ui/pages/signup_page.dart';
import 'core/constants/configs.dart';
import 'core/constants/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Configs.appTitle,
      initialRoute: AuthRoutes.login,
      theme: CustomThemes.lightTheme,
      routes: {
        AuthRoutes.login: (context) => LoginPage(),
        AuthRoutes.signup: (context) => const SignupPage(),
        AuthRoutes.forgotPassword: (context) => ForgotPasswordPage(),
        AuthRoutes.homePage: (context) => const Placeholder(),
        AuthRoutes.emailVerification: (context) =>
            const EmailVerficiationPage(),
        AuthRoutes.newPassword: (context) => const NewPasswordPage(),
      },
    );
  }
}
