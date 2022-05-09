import 'dart:developer';

import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tooShort }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    log(value ?? 'hello');
    if (value?.isNotEmpty == true) {
      return value!.length >= 8 ? null : PasswordValidationError.tooShort;
    } else {
      return PasswordValidationError.empty;
    }
  }
}
