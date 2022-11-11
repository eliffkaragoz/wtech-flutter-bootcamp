import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isObscure = true;
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  late String password;
  double _strength = 0;
  String _helperText = 'Password must have at least 8 characters.';
  @override
  void initState() {
    super.initState();
    password = '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        height: size.height,
        child: Form(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: CustomTextFormField(
                          enabled: false,
                          initialValue: "melihcelik0909@gmail.com",
                          textColor: Colors.grey,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Email',
                        ),
                      ),
                      const CustomTextFormField(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Confirm Email',
                        hintText: 'Confirm Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: CustomTextFormField(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelText: 'First Name',
                                hintText: 'Enter first name',
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: CustomTextFormField(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                labelText: 'Surname',
                                hintText: 'Enter surname',
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextFormField(
                        onChanged: (value) => _checkPassword(value),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                        ),
                        helperText: _helperText,
                        obscureText: _isObscure,
                      ),
                      password.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      value: _strength,
                                      minHeight: 10,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        _strength < 0.3
                                            ? Colors.red
                                            : _strength < 0.6
                                                ? Colors.yellow
                                                : Colors.green,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC14D25),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkPassword(String value) {
    password = value.trim();
    if (password.isEmpty) {
      setState(() {
        _strength = 0;
        _helperText = 'Password must have at least 8 characters.';
      });
    } else if (password.length < 8) {
      setState(() {
        _strength = 0.25;
        _helperText = 'Weak';
      });
    } else {
      if (!regex.hasMatch(password)) {
        setState(() {
          _strength = 0.5;
          _helperText = 'Average';
        });
      } else {
        setState(() {
          // should contain at least one upper case
          // should contain at least one lower case
          // should contain at least one digit
          // should contain at least one special character
          // Must be at least 8 characters in length
          _strength = 1;
          _helperText = 'Your password is great.';
        });
      }
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final bool? obscureText;
  final String? initialValue;
  final Color? textColor;
  final bool? enabled;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.obscureText,
    this.initialValue,
    this.enabled,
    this.keyboardType,
    this.floatingLabelBehavior,
    this.suffixIcon,
    this.textColor,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: TextStyle(color: textColor),
      initialValue: initialValue,
      enabled: enabled,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
      ),
    );
  }
}
