import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rent_app/models/user.dart';
import 'package:rent_app/modules/user/pages/login.dart';
import 'package:rent_app/shared/reactive_text_field.dart';
import 'package:rent_app/shared_preferences/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FormGroup _formUser = FormGroup({
    "names": FormControl(validators: [Validators.required]),
    "phone": FormControl(validators: [Validators.required, Validators.number]),
    "email": FormControl(validators: [Validators.required, Validators.email]),
    "password": FormControl(validators: [Validators.required]),
  });

  final _validationMessages = {
    ValidationMessage.required: "Filed is required",
    ValidationMessage.email: "Email is invalid",
    ValidationMessage.number: "Field is numeric"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _rowTitle(),
              const SizedBox(
                height: 10,
              ),
              _rowSubtitle(),
              const SizedBox(
                height: 30,
              ),
              _columnForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowTitle() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Sign up",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30)),
        ]);
  }

  Widget _rowSubtitle() {
    return Row(children: const [
      Text("To discover a lot options to live",
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w200,
            //fontSize: 24
          ))
    ]);
  }

  Widget _columnForm() {
    return ReactiveForm(
      formGroup: _formUser,
      child: Wrap(
        runSpacing: 20,
        children: [
          ReactiveTextFieldWidget(
            formControlName: "names",
            iconData: Icons.person,
            label: "Names",
            hinText: "Type your names",
            validationMessages: _validationMessages,
          ),
          ReactiveTextFieldWidget(
              formControlName: "email",
              iconData: Icons.mail,
              label: "Email",
              hinText: "Type your email",
              validationMessages: _validationMessages,
              textInputType: TextInputType.emailAddress),
          ReactiveTextFieldWidget(
            formControlName: "password",
            iconData: Icons.password,
            label: "Password",
            hinText: "Type your password",
            validationMessages: _validationMessages,
            obscureText: true,
            textInputType: TextInputType.visiblePassword,
          ),
          ReactiveTextFieldWidget(
            formControlName: "phone",
            iconData: Icons.phone,
            label: "Phone",
            hinText: "Type your phone",
            validationMessages: _validationMessages,
            textInputType: TextInputType.phone,
          ),
          _rowAction()
        ],
      ),
    );
  }

  Widget _rowAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () async {
              if (_formUser.invalid) {
                _formUser.markAllAsTouched();
              } else {
                // final userPreferences = UserPreferences();
                // userPreferences.user = User.fromJson(_formUser.value);
                // final route =
                //     MaterialPageRoute(builder: (context) => LoginPage());
                // Navigator.push(context, route);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              color: Theme.of(context).primaryColor,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Register now",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
