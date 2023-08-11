import 'package:flutter/material.dart';
import 'components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  // Firestore'a kullanıcı bilgilerini kaydetmek için fonksiyon
  void saveUserDataToFirestore(
      {required String uid, required String name, required String email}) {
    final usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(uid).set({
      'name': name,
      'email': email,
      // Diğer kullanıcı verilerini istediğiniz gibi ekleyebilirsiniz.
    }).then((_) {
      print("Kullanıcı verileri Firestore'a kaydedildi!");
    }).catchError((error) {
      print("Kullanıcı verilerini kaydederken hata oluştu: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Kayıt Ol"),
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
                    controller: nameController,
                    hintText: "name",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
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
                  //Zaten üyeyim
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Zaten Üyeyim?",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //Kayıt ol butonu
                  ElevatedButton(
                    onPressed: () {
                      registerWithEmailAndPassword(
                          emailController.text, passwordController.text);
                    },
                    style: ButtonStyle(
                      // Arka plan rengi
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      // Yükseklik
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(300, 60)),
                      // İsteğe bağlı: İçeriğin rengi
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text(
                      "KAYIT OL",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
// Kullanıcı oluşturma başarılı oldu, Firestore'a kullanıcı verilerini kaydedebilirsiniz.
      String uid = userCredential.user!.uid;
      String name = nameController.text;

      // Firestore'a kayıt ekleyin
      saveUserDataToFirestore(uid: uid, name: name, email: email);
    } catch (e) {
      // Kayıt işlemi başarısız oldu.
      print("Kullanıcı oluşturulurken hata oluştu: $e");
      // Hata durumlarına göre kullanıcıya uygun geri bildirimler sağlayabilirsiniz.
    }
  }
}

// Diğer sayfaları ve MyTextField widget'ını da eklemeyi unutmayın.
