import 'package:flutter/material.dart';

import '../../../../core/ui/themes.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: UIConstants.mdSize,
      ),
    );
  }
}
