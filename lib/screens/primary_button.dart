import 'package:flutter/material.dart';

class PrimaryAppButton extends StatelessWidget {
  final String buttonText;
  final Color buttonBackground;
  final VoidCallback buttonOnClick;

  const PrimaryAppButton({
    super.key,
    required this.buttonText,
    required this.buttonBackground,
    required this.buttonOnClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonBackground,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: buttonOnClick,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
