import 'package:flutter/material.dart';

class TitleAndButtonWidget extends StatelessWidget {
  final String title, buttonName;
  const TitleAndButtonWidget({
    Key? key,
    required this.title,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          child: Text(buttonName),
        ),
      ],
    );
  }
}