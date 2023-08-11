import 'package:flutter/material.dart';

import 'models/yemek.dart';

class BalikPage extends StatelessWidget {
  final List<Yemek> yemekler = [
    Yemek(name: 'Palamut Fileto', imagePath: 'images/palamut.jpg'),
    Yemek(name: 'Fırında Kolyoz', imagePath: 'images/kolyoz.jpg'),
    Yemek(name: 'Fırında Hamsi', imagePath: 'images/hamsi.jpg'),
  ];
  BalikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 161, 181),
        title: const Text('BALIKLAR'),
      ),
      body: ListView.builder(
        itemCount: yemekler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              height:
                  100, // ListTile'ın yüksekliğini arttırmak için Container'ın yüksekliğini belirleme
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: Center(
                child: ListTile(
                  onTap: () {
                    print('Tıklandı: ${yemekler[index].name}');
                  },
                  leading: Image.asset(
                    yemekler[index].imagePath,
                    width: 100, // Resim boyutunu ayarlamak için yükseklik belirleme
                    height:
                        100, // Resim boyutunu ayarlamak için genişlik belirleme
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    yemekler[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
