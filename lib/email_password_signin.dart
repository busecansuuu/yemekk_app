import 'package:bus_chatapp/components/my_button.dart';
import 'package:bus_chatapp/components/my_textfield.dart';
import 'package:bus_chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';

class EmailPasswordSignIn extends StatelessWidget {
  EmailPasswordSignIn({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Oturum Aç"),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Icon(
                    Icons.lock_person_sharp,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                    controller: emailController,
                    hintText: "E-mail",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Şifre",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Şifremi unuttum
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Şifremi Unuttum?",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //Giriş yap butonu
                  MyButton(onPressed: () async {
                    _authService.SignIn(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
