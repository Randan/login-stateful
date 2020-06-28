import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            submitButton()
          ]
        )
      )
    );

  Widget emailField() =>
    TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com'
      ),
      validator: validateEmail,
      onSaved: (String value) => email = value,
    );

  Widget passwordField() =>
    TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password'
      ),
      validator: validatePassword,
      onSaved: (String value) => password = value,
    );

  Widget submitButton() =>
    RaisedButton(
      child: Text('Submit'),
      color: Colors.orange,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post my $email and $password to my API');
        }
      }
    );

}