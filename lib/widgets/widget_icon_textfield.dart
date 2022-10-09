import 'package:flutter/material.dart';

class WidgetIconTextfield extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String? hintText;
  final bool? obscureText;
  final bool? enableSuggestions;
  final int? maxLines;

  const WidgetIconTextfield({
    super.key,
    required this.controller,
    required this.iconData,
    this.hintText,
    this.obscureText,
    this.enableSuggestions,
    this.maxLines,
  });

  @override
  State<WidgetIconTextfield> createState() => _WidgetIconTextfieldState();
}

class _WidgetIconTextfieldState extends State<WidgetIconTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        elevation: 8,
        shadowColor: Colors.black87,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          enableSuggestions: widget.enableSuggestions ?? true,
          maxLines: widget.maxLines ?? 1,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            prefixIcon: Icon(widget.iconData),
          ),
        ),
      ),
    );
  }
}
