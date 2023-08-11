import 'package:bus_chatapp/anayemek.dart';
import 'package:bus_chatapp/hamurisi.dart';
import 'package:flutter/material.dart';
import 'balik.dart';
import 'corba.dart';

import 'meze.dart';
import 'tatli.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> itemTexts = ['Çorba', 'Tatli', 'Meze', 'Balik', 'Ana Yemek', 'Hamur İsi'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 222, 161, 181),
          title:const Text('Home Page'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Kategoriye göre sayfaya yönlendirme yap
                switch (itemTexts[index]) {
                  case 'Çorba':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CorbaPage()),
                    );
                    break;
                  case 'Tatli':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TatliPage()),
                    );
                    break;
                  case 'Meze':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MezePage()),
                    );
                    break;
                  // Diğer kategoriler için aynı yöntemi kullanın
                   case 'Balik':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BalikPage()),
                    );
                    break;
                     case 'Ana Yemek':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnaYemekPage()),
                    );
                    break;
                     case 'Hamur İsi':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HamurisiPage()),
                    );
                    break;
                }
              },
              child: Container(
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/creambackground.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    itemTexts[index],
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            );
          },
          itemCount: itemTexts.length,
        ),
      ),
    );
  }
}
