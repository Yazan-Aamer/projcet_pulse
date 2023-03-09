import 'package:flutter/material.dart';

import '../../../../core/ui/themes.dart';

class VerificationCodeInput extends StatefulWidget {
  const VerificationCodeInput({super.key});

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final FocusNode firstCharFocusNode = FocusNode();
  final FocusNode secondCharFocusNode = FocusNode();
  final FocusNode thirdCharFocusNode = FocusNode();
  final FocusNode fourthCharFocusNode = FocusNode();
  @override
  void dispose() {
    firstCharFocusNode.dispose();
    secondCharFocusNode.dispose();
    thirdCharFocusNode.dispose();
    fourthCharFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleCodeInput(
          currentFocusNode: firstCharFocusNode,
          targetFocusNode: secondCharFocusNode,
        ),
        SingleCodeInput(
          currentFocusNode: secondCharFocusNode,
          targetFocusNode: thirdCharFocusNode,
        ),
        SingleCodeInput(
          currentFocusNode: thirdCharFocusNode,
          targetFocusNode: fourthCharFocusNode,
        ),
        SingleCodeInput(
          currentFocusNode: fourthCharFocusNode,
          targetFocusNode: fourthCharFocusNode,
        ),
      ],
    );
  }
}

class SingleCodeInput extends StatelessWidget {
  const SingleCodeInput({
    super.key,
    required this.currentFocusNode,
    required this.targetFocusNode,
  });

  final FocusNode currentFocusNode;
  final FocusNode targetFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIConstants.mdSize,
      child: TextFormField(
        focusNode: currentFocusNode,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).requestFocus(targetFocusNode);
          }
        },
        maxLength: 1,
        decoration: const InputDecoration(
            counterText: "", border: UnderlineInputBorder()),
      ),
    );
  }
}
