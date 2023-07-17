import 'package:flutter/material.dart';

import 'show_page.dart';
import 'widgets/icons_button.dart';
import 'widgets/text_fields.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  String? emailValidationText;
  String? passwordValidationText;

  String email = "";
  String password = "";

  bool get isAllInputsAreValid => email.isNotEmpty && password.isNotEmpty;

  void validateEmail(String value) {
    if (!RegExp(r"^[a-zA-Z][a-zA-Z0-9]*@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
        .hasMatch(value)) {
      setState(() {
        emailValidationText = "Invalid email address!";
      });
      return;
    }

    setState(() {
      emailValidationText = null;
      email = value;
    });
  }

  void validatePassword(String value) {
    if (!RegExp(r".{8,}").hasMatch(value)) {
      setState(() {
        passwordValidationText =
            "Password is too short, it must be at least 8 characters";
      });
      return;
    }

    if (value.contains(" ")) {
      setState(() {
        passwordValidationText = "Password shouldn't have space";
      });
      return;
    }

    if (!RegExp(r"\d").hasMatch(value)) {
      setState(() {
        passwordValidationText = "Password must have at least one number";
      });
      return;
    }

    if (!RegExp(r"[a-z]").hasMatch(value)) {
      setState(() {
        passwordValidationText = "Password must have at least one letter";
      });
      return;
    }

    if (!RegExp(r"[A-Z]").hasMatch(value)) {
      setState(() {
        passwordValidationText =
            "Password must have at least one Capital letter";
      });
      return;
    }

    setState(() {
      passwordValidationText = null;
      password = value;
    });
  }

  void openShowPage() => isAllInputsAreValid
      ? Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ShowPage(),
    ),
  )
      : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 40),
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 40),
              child: SizedBox(
                height: 50,
                width: 220,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A1B),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 40,
                          width: 110,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                              color: Color(0x663E3E41),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF575758),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFields(
                errorText: emailValidationText,
                onSubmitted: validateEmail,
                exampleText: "you@example.com",
                infoText: "Email address",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFields(
                errorText: passwordValidationText,
                onSubmitted: validatePassword,
                isObscure: true,
                exampleText: "Your password",
                infoText: "Password",
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: GestureDetector(
                onTap: openShowPage,
                child: const SizedBox(
                  height: 60,
                  width: 350,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF7339E5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7339E5),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const Center(
              child: Text(
                "Sign in with",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF575758),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconsButton(
                    image: "assets/images/Icons.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconsButton(
                    image: "assets/images/Vector.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconsButton(
                    image: "assets/images/tweet.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
