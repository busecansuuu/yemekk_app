import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class AuthService {
//Google Girişi
  signInWithGoogle() async {
    //etkileşimli oturum açma sürecini başlat
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      // Kullanıcı Google hesabına giriş yapmadı
      return null;
    }

    //istekten kimlik doğrulama ayrıntılarını al
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Kullanıcı için yeni bir kimlik bilgisi oluştur
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    // Firebase Authentication'a giriş yap
    final UserCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> SignIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: "Giriş Başarılı");
        print("Giriş yapıldı");

        // Giriş başarılı olduğunda ana sayfaya yönlendirme işlemi
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MyHomePage()), // Ana sayfanızın ismi burada "MyHomePage" olarak düşünülmüş.
        );
      } else {
        Fluttertoast.showToast(msg: "Giriş Başarısız");
        print("Giriş yapılamadı");
      }
    } catch (e) {
      print("Giriş yaparken hata oluştu: $e");
    }
  }
}
