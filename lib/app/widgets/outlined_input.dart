import 'package:flutter/material.dart';

class OutlinedInput extends StatelessWidget {
  const OutlinedInput({
    Key? key,
    this.hint,
    this.prefixText,
    this.initialValue,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  final String? hint;
  final String? prefixText;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixText != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Text("${prefixText!}:"),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
