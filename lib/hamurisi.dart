import 'package:flutter/material.dart';

import 'models/yemek.dart';

class HamurisiPage extends StatelessWidget {
  final List<Yemek> yemekler = [
    Yemek(name: 'Pankek', imagePath: 'images/pankek.jpg'),
    Yemek(name: 'Pişi', imagePath: 'images/pisi.jpg'),
    Yemek(name: 'Dereotlu Poğaça', imagePath: 'images/dereotlupogaca.jpg'),
    
  ];
HamurisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 161, 181),
        title: const Text('HAMUR İŞLERİ'),
      ),
      body: ListView.builder(
        itemCount: yemekler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              height: 100, // ListTile yüksekliği için containerın yüksekliğini değiştirdim.
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
                    width: 100, // Resim boyutunu için yükseklik
                    height:100, // Resim boyutu için genişlik
                    fit: BoxFit.cover,
                  ),
                  title: Text(yemekler[index].name, style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
