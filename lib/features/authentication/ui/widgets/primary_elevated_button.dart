import 'package:flutter/material.dart';

import '../../../../core/ui/themes.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(
              UIConstants.smPadding,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIConstants.smCorners))),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
