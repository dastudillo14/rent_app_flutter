import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rent_app/modules/apartments/pages/home.dart';
import 'package:rent_app/shared/reactive_text_field.dart';
import 'package:rent_app/shared/toast.dart';
import 'package:rent_app/shared_preferences/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FormGroup _formLogin = FormGroup({
    "email": FormControl(
        value: "dantee@gas.com",
        validators: [Validators.required, Validators.email]),
    "password": FormControl(value: "12345", validators: [Validators.required]),
  });

  final _validationMessages = {
    ValidationMessage.required: "Filed is required",
    ValidationMessage.email: "Email is invalid",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
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
          Text("Log In",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30)),
        ]);
  }

  Widget _columnForm() {
    return ReactiveForm(
      formGroup: _formLogin,
      child: Wrap(
        runSpacing: 20,
        children: [
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
              if (_formLogin.invalid) {
                _formLogin.markAllAsTouched();
              } else {
                final userPreferences = UserPreferences();
                String email = _formLogin.control("email").value;
                String password = _formLogin.control("password").value;

                if (userPreferences.user != null) {
                  if (userPreferences.user!.email != email ||
                      userPreferences.user!.password != password) {
                    showToast(
                        context, const Text("User and password incorrect"));
                  } else {
                    final route = MaterialPageRoute(
                        builder: (context) => const HomePage());
                    userPreferences.login = true;
                    Navigator.push(context, route);
                  }
                } else {
                  showToast(context, const Text("User and password incorrect"));
                }
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              color: Theme.of(context).primaryColor,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Log In",
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
