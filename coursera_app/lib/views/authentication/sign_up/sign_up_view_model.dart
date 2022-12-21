import '../../../core/base/base_view_model.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends IViewModel<SignUpViewModel> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  bool _isFormValidateName = false;
  bool get isFormValidateName => _isFormValidateName;

  bool _isFormValidateEmail = false;
  bool get isFormValidateEmail => _isFormValidateEmail;

  bool _isFormValidatePassword = false;
  bool get isFormValidatePassword => _isFormValidatePassword;

  changeObscureTextState() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  controlControllerLength(value, {required String validateType}) {
    switch (validateType) {
      case 'name':
        _isFormValidateName = control(value);
        notifyListeners();
        break;
      case 'email':
        _isFormValidateEmail = control(value);
        notifyListeners();
        break;
      case 'password':
        _isFormValidatePassword = control(value);
        notifyListeners();
        break;
      default:
    }
  }

  control(value) {
    return (value.length > 0) ? true : false;
  }
}
