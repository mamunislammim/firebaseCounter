import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Sign Up page"),
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
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email.text,
                  password: _password.text,
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
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
