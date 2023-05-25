import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class LoginScreen extends StatelessWidget {
  final String? username;

  const LoginScreen({
    super.key,
    this.username,
  });

  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 60.0),
            children: [
              const SizedBox(
                height: 100,
                child: Image(
                  image: AssetImage(
                    'assets/fooderlich_assets/loginlogo.png',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              buildTextfield(username ?? 'USERNAME:'),
              const SizedBox(height: 16),
              buildTextfield('PASSWORD:'),
              const SizedBox(
                height: 10,
                width: 3,
              ),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 12,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'LOG IN!',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          // TODO: Initiate Login
          Provider.of<AppStateManager>(context, listen: false)
              .login('mockUsername', 'mockPassword');
        },
      ),
    );
  }

  Widget buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 0.3,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
