import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final String infoText;
  final String exampleText;
  final bool? isObscure;
  final String? errorText;
  final void Function(String value) onSubmitted;

  const TextFields({
    required this.onSubmitted,
    required this.infoText,
    required this.exampleText,
    this.isObscure,
    this.errorText,
    super.key,
  });

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool? showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = widget.isObscure;
  }

  void changeObscure() {
    if (showPassword != null) {
      setState(() => showPassword = !showPassword!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.infoText,
              style: const TextStyle(
                color: Color(0xFF575758),
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: widget.onSubmitted,
            obscuringCharacter: "*",
            obscureText: showPassword ?? false,
            decoration: InputDecoration(
              errorStyle: TextStyle(
                color:  Color(0xFFB04F4F),
              ),
              errorText: widget.errorText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF3E3E41)),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFF262629),
              suffixIcon: showPassword != null
                  ? GestureDetector(
                      onTap: changeObscure,
                      child: Icon(
                        showPassword! ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF878787),
                      ),
                    )
                  : null,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: widget.exampleText,
              hintStyle: const TextStyle(
                color: Color(0xFF575758),
                fontSize: 16,
              ),
            ),
            showCursor: true,
            cursorColor: const Color(0xFF804CEF),
            style: const TextStyle(
              color: Color(0xFF878787),
            ),
          ),
        )
      ],
    );
  }
}
