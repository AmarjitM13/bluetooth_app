import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final void Function() onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blueAccent.withOpacity(0.3),
        ),
        onPressed: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
