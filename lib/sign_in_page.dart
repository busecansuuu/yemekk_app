import 'package:bus_chatapp/common_widget/social_loginbutton.dart';
import 'package:bus_chatapp/services/auth_service.dart';
import 'package:bus_chatapp/sign_up.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'email_password_signin.dart';

class SignInPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CANLI SOHBET UYGULAMASI"),
        elevation: 10, //GÖLGE
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              butonText: "Google ile Giriş Yap",
              butonColor: Colors.white,
              textColor: Colors.black,
              radius: 16,
              butonIcon: Image.asset("images/google.png"),
              onPressed: () {
                _authService.signInWithGoogle();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SocialLoginButton(
                butonText: "Kayıt Ol",
                butonColor: const Color(0xFF334D92),
                textColor: Colors.white,
                radius: 16,
                butonIcon: const Icon(Icons.man_2_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            SocialLoginButton(
                butonText: "Email ve Şifre ile Giriş Yap",
                butonColor: Colors.purple,
                textColor: Colors.white,
                radius: 16,
                butonIcon: Image.asset("images/mail.png"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailPasswordSignIn(),
                    ),
                  );
                }),
            SocialLoginButton(
                butonText: "Misafir Girişi",
                butonColor: Colors.pink,
                textColor: Colors.white,
                radius: 16,
                butonIcon: const Icon(Icons.person),
                onPressed: _misafirGirisi),
          ],
        ),
      ),
    );
  }

  void _misafirGirisi() async {
    UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
    print("Anonim kullanıcı id:" + sonuc.user!.uid.toString());
  }
}
