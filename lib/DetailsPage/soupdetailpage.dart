import 'package:flutter/material.dart';

import '../models/yemek.dart';

class SoupDetailPage extends StatelessWidget {
  final Yemek yemek;
  final Tarif tarif;

  final List<Tarif> tarifler = [
    Tarif(
        malzeme:
            '1 yemek kaşığı tereyağı, 2 çay bardağı sıcak süt ,5 adet büyük boy domates ,2 yemek kaşığı un, 4 su bardağı sıcak et suyu, 2 çay kaşığı tuz,1 su bardağı rendelenmiş kaşar peyniri',
        tarif:
            'Tereyağını tavada eritin.Unu ekleyip kokusu çıkana kadar kısık ateşte kavurun.Rendelenmiş domatesleri kavrulmuş un karışımına ekledikten sonra 5 dakika kadar pişirin.Üzerine sıcak et suyunu ve tuzu ilave edin. Kesilmemesi için küçük bir cezvede ısıttığınız sütü azar azar ekleyip hızlıca karıştırın.Çorbayı kaynayana kadar orta ateşte ardından da kısık ateşte 15 dakika kadar pişirin. Daha pürüzsüz bir kıvam alması için blenderdan geçirin. Servis kaselerine aldığınız çorbayı, rendelenmiş kaşar peynir ilavesiyle sıcak olarak servis edin. '),
    Tarif(
        malzeme:
            '3 yemek kaşığı ayçiçek yağı,1 adet kuru soğan ,1 yemek kaşığı un, 1 adet havuç, 1 adet patates ,1 tatlı kaşığı tuz,1 çay kaşığı karabiber,1,5 su bardağı kırmızı ya da sarı mercimek,6 su bardağı sıcak su (1 adet et su tablet ile hazırlanmış),3 yemek kaşığı sıvı yağ,2 yemek kaşığı tereyağı,1 tatlı kaşığı kırmızı toz biber',
         tarif: 'Derin bir tencereye 3 yemek kaşığı sıvı yağ ekleyin. İri doğranmış 1 adet büyük soğanı sıvı yağ ile birlikte kavurun.Kavrulan soğanlara 1 yemek kaşığı unu ekleyin ve kavurmaya devam edin. İri parçalar halinde doğradığınız birer adet havuç ve patatesi tencereye aktarın.Tuz, karabiber ve bol suda yıkadıktan sonra suyunu süzdürdüğünüz 1,5 su bardağı mercimeği  de ilave edin ve son kez güzelce karıştırın.6 su bardağı sıcak suyu da tencereye ilave edin. Ardından kapağını kapatın, patates ve havuçlar yumuşayana kadar ara ara karıştırarak 40 dakika kadar pişirin.Çorba piştikten sonra pürüzsüz bir kıvam alması için; el blenderından geçirin. 5 dakika daha pişirdikten sonra ocaktan alın.3 yemek kaşığı sıvı yağ ve 2 yemek kaşığı tereyağını bir tavada kızdırın. Üzerine 1 tatlı kaşığı toz kırmızı biberi ekleyin ve 2 dakika yağı kızdırdıktan sonra ocaktan alın.Çorbayı bir kaseye alın ve üzerine kızdırdığınız yağdan gezdirip servis edin.'),
    Tarif(
        malzeme: '1 su bardağı pirinç,2 su bardağı yoğurt,1 yemek kaşığı un, 1 adet yumurta, 4 su bardağı su,2 yemek kaşığı tereyağı, 1 adet soğan,1 yemek kaşığı nane',
        tarif: 'Öncelikle pirinçleri yıkayıp 2 su bardağı su ekleyerek yumuşayana kadar haşlıyoruz.Haşlanan pirinçlerin üzerine 4 su bardağı suyumuzu ekliyoruz. Kontrollü eklemenizde fayda var, katı olursa suyunu sonradan da ilave edebilirsiniz.Diğer tarafta yoğurt, un ve yumurtayı pürüzsüz kıvama gelene kadar çırpıyoruz.Kaynayan çorba suyundan terbiyemize azar azar ekleyelim ki çorbaya kattığımızda yoğurdumuz kesilmesin.Ilınan terbiyeyi yavaş yavaş karıştırarak çorbaya ilave ediyoruz. Kaynamaya başladıkça kıvam alacaktır, kıvmama göre gerekirse su ekleyebilirsiniz.10 dakika daha kaynatıp tuzunu da ekleyip altını kapatıyoruz.Başka bir tavada tereyağını eritip ince ince doğradığımız soğanları kavuruyoruz. Soğanlar yumuşayınca naneyi de ekleyip çok az daha kavurup altını kapatıyoruz.Naneli sosu çorbamızın üzerine döküyoruz. Ve mis gibi kokan yayla çorbamız hazır!'),
  ];

  SoupDetailPage({super.key, required this.yemek, required this.tarif});

  @override
  Widget build(BuildContext context) {
    // Your code to display the details of the selected soup goes here
    // Access the selected soup using 'yemek' variable
    // For example, you can display the soup name and image on this page.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 161, 181),
        title: Text(yemek.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(yemek.imagePath),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const Text(
                      "Malzemeler",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                        height: 20), // Add some space between the image and Tarif
                    Text(
                      tarif.malzeme,
                    ),
                  ]),
                ),
              ),
            const  SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Tarif",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                          height: 10), // Add some space between Tarif properties
                      Text(tarif.tarif),
                      const SizedBox(height: 20),
                      const Text(
                        "Afiyet Olsun!",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
