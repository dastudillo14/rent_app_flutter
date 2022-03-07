import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveTextFieldWidget extends StatefulWidget {
  String formControlName;
  Map<String, String>? validationMessages;
  String label;
  TextInputType? textInputType = TextInputType.text;
  String? hinText;
  String? errorText;
  bool? obscureText = false;
  int? maxLines;
  IconData iconData;

  Widget? suffixIcon = const Icon(Icons.add);

  ReactiveTextFieldWidget(
      {Key? key,
      required this.formControlName,
      this.validationMessages,
      required this.label,
      this.hinText,
      this.errorText,
      this.suffixIcon,
      this.obscureText,
      this.maxLines , 
      required this.iconData,
      this.textInputType
      })
      : super(key: key);

  @override
  _ReactiveTextFieldWidgetState createState() =>
      _ReactiveTextFieldWidgetState();
}

class _ReactiveTextFieldWidgetState extends State<ReactiveTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ReactiveTextField(
            formControlName: widget.formControlName,
            validationMessages: widget.validationMessages != null
                ? (control) => widget.validationMessages!
                : null,
            maxLines: widget.obscureText == true ? 1 : widget.maxLines,
            keyboardType: widget.textInputType,
            obscureText: widget.obscureText ?? false,
            style: const TextStyle(
              height: 1,
              color: Colors.black,
            ),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: Icon(
                  widget.iconData,
                  size: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: widget.hinText,
              ),),
      ],
    );
  }
}