import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
    return Wrap(
      runSpacing: 20,
      children: [
        _rowTextField(
            "Names", "Type your names", TextInputType.name, Icons.person),
        _rowTextField(
            "Phone", "Type your phone", TextInputType.phone, Icons.phone),
        _rowTextField(
            "Email", "Type your Email", TextInputType.emailAddress, Icons.mail),
        _rowTextField("Password", "Type your password",
            TextInputType.visiblePassword, Icons.password,
            obscureText: true),
        _rowAction()
      ],
    );
  }

  Widget _rowTextField(String label, String hinText,
      TextInputType textInputType, IconData iconData,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        TextField(
          obscureText: obscureText,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: Icon(
              iconData,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: hinText,
          ),
        )
      ],
    );
  }

  Widget _rowAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
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
        )
      ],
    );
  }
}
