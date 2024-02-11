import 'package:flutter/material.dart';

class SDTextfield extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool secure;
  final String? value;
  final Widget? iconsurfix;
  final String? Function(String?)? validator;
  final TextEditingController? kontroler;
  final DateTime? tanggal;
  final bool? enable;
  final bool? filled;
  final Color? fillColor;
  const SDTextfield({
    Key? key,
    this.enable,
    this.label,
    this.hintText,
    this.iconsurfix,
    this.validator,
    this.value,
    this.kontroler,
    required this.secure,
    this.filled,
    this.fillColor,
    this.tanggal,
  }) : super(key: key);

  @override
  State<SDTextfield> createState() => _SDTextfieldState();
}

class _SDTextfieldState extends State<SDTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xff292F33),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          maxLines: 1,
          enabled: widget.enable,
          controller: widget.kontroler,
          initialValue: widget.value,
          obscureText: widget.secure,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: widget.filled,
            fillColor: widget.fillColor,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            suffixIcon: widget.iconsurfix,
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
