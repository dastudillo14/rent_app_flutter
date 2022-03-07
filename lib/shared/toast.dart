import 'package:flutter/material.dart';

void showToast(BuildContext context, Widget content) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: content,
    ),
  );
}
