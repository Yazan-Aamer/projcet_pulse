import 'package:flutter/material.dart';

import '../../../../core/ui/themes.dart';

class TextInputWithLabel extends StatelessWidget {
  final String label;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  bool? obscureText = false;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  TextInputWithLabel({
    super.key,
    required this.label,
    this.onSaved,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIConstants.mdSize,
      child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          onSaved: onSaved,
          controller: controller,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.labelMedium,
              label: Text(label),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(UIConstants.smCorners)))),
    );
  }
}
