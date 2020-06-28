import 'package:email_validator/email_validator.dart';

class ValidationMixin {
  String validateEmail(String value) =>
    EmailValidator.validate(value) ? null : 'Please enter a valid email';

  String validatePassword(String value) =>
    value.length >= 4 ? null : 'Password must be at least 4 characters';
}