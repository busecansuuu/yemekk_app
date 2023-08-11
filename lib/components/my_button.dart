import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;

  const MyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // Arka plan rengi
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          // Yükseklik
          minimumSize: MaterialStateProperty.all<Size>(const Size(300, 60)),
          // İsteğe bağlı: İçeriğin rengi
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: const Text(
          "GİRİŞ YAP",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
