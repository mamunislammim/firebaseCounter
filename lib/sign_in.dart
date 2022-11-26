import 'package:counter_app_firebase/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign In page"),
            const SizedBox(height: 80,),
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
              controller: _email,
            ),
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              controller: _password,
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: ()async{
              try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email.text,
                    password: _password.text
                );

              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            },
                child: const Text("Sent"),
            )
          ],
        ),
      ),
    );
  }
}
