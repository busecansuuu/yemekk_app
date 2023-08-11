import 'package:flutter/material.dart';
import 'DetailsPage/soupdetailpage.dart';

import 'models/yemek.dart';

class CorbaPage extends StatelessWidget {
  final List<Yemek> yemekler = [
    Yemek(name: 'Domates Çorbası', imagePath: 'images/domatescorbasi.jpg'),
    Yemek(name: 'Mercimek Çorbası', imagePath: 'images/mercimekcorbasi.jpg'),
    Yemek(name: 'Yayla Çorbası', imagePath: 'images/yaylacorbasi.jpg'),
  ];
  final List<Tarif> tarifler = [
    Tarif(
        malzeme:
            '1 yemek kaşığı tereyağı, 2 çay bardağı sıcak süt ,5 adet büyük boy domates ,2 yemek kaşığı un, 4 su bardağı sıcak et suyu, 2 çay kaşığı tuz,1 su bardağı rendelenmiş kaşar peyniri',
        tarif:
            'Tereyağını tavada eritin.Unu ekleyip kokusu çıkana kadar kısık ateşte kavurun.Rendelenmiş domatesleri kavrulmuş un karışımına ekledikten sonra 5 dakika kadar pişirin.Üzerine sıcak et suyunu ve tuzu ilave edin. Kesilmemesi için küçük bir cezvede ısıttığınız sütü azar azar ekleyip hızlıca karıştırın.Çorbayı kaynayana kadar orta ateşte ardından da kısık ateşte 15 dakika kadar pişirin. Daha pürüzsüz bir kıvam alması için blenderdan geçirin. Servis kaselerine aldığınız çorbayı, rendelenmiş kaşar peynir ilavesiyle sıcak olarak servis edin. '),
    Tarif(
        malzeme:
            '3 yemek kaşığı ayçiçek yağı,1 adet kuru soğan ,1 yemek kaşığı un, 1 adet havuç, 1 adet patates ,1 tatlı kaşığı tuz,1 çay kaşığı karabiber,1,5 su bardağı kırmızı ya da sarı mercimek,6 su bardağı sıcak su (1 adet et su tablet ile hazırlanmış),3 yemek kaşığı sıvı yağ,2 yemek kaşığı tereyağı,1 tatlı kaşığı kırmızı toz biber',
        tarif:
            'Derin bir tencereye 3 yemek kaşığı sıvı yağ ekleyin. İri doğranmış 1 adet büyük soğanı sıvı yağ ile birlikte kavurun.Kavrulan soğanlara 1 yemek kaşığı unu ekleyin ve kokusu çıkıp, renk alana kadar kavurma işlemini sürdürün. İri parçalar halinde doğradığınız birer adet havuç ve patatesi tencereye aktarıp karıştırmaya devam edin.Tuz, karabiber ve bol suda yıkadıktan sonra suyunu süzdürdüğünüz 1,5 su bardağı mercimeği  de ilave edin ve son kez güzelce karıştırın.6 su bardağı sıcak suyu da tencereye ilave edin.Ardından kapağını kapatın, patates ve havuçlar yumuşayana kadar ara ara karıştırarak 40 dakika kadar pişirin.Çorba piştikten sonra pürüzsüz bir kıvam alması için; el blenderından geçirin. 5 dakika daha pişirdikten sonra ocaktan alın.3 yemek kaşığı sıvı yağ ve 2 yemek kaşığı tereyağını bir tavada kızdırın. Üzerine 1 tatlı kaşığı toz kırmızı biberi ekleyin ve 2 dakika yağı kızdırdıktan sonra ocaktan alın.Çorbayı bir kaseye alın ve üzerine kızdırdığınız yağdan gezdirip servis edin.'),
    Tarif(
        malzeme: '1 su bardağı pirinç,2 su bardağı yoğurt,1 yemek kaşığı un, 1 adet yumurta, 4 su bardağı su,2 yemek kaşığı tereyağı, 1 adet soğan,1 yemek kaşığı nane',
        tarif: 'Öncelikle pirinçleri yıkayıp 2 su bardağı su ekleyerek yumuşayana kadar haşlıyoruz.Haşlanan pirinçlerin üzerine 4 su bardağı suyumuzu ekliyoruz. Kontrollü eklemenizde fayda var, katı olursa suyunu sonradan da ilave edebilirsiniz.Diğer tarafta yoğurt, un ve yumurtayı pürüzsüz kıvama gelene kadar çırpıyoruz.Kaynayan çorba suyundan terbiyemize azar azar ekleyelim ki çorbaya kattığımızda yoğurdumuz kesilmesin.Ilınan terbiyeyi yavaş yavaş karıştırarak çorbaya ilave ediyoruz. Kaynamaya başladıkça kıvam alacaktır, kıvmama göre gerekirse su ekleyebilirsiniz.10 dakika daha kaynatıp tuzunu da ekleyip altını kapatıyoruz.Başka bir tavada tereyağını eritip ince ince doğradığımız soğanları kavuruyoruz. Soğanlar yumuşayınca naneyi de ekleyip çok az daha kavurup altını kapatıyoruz.Naneli sosu çorbamızın üzerine döküyoruz. Ve mis gibi kokan yayla çorbamız hazır!'),
  ];

  CorbaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 161, 181),
        title: const Text('ÇORBALAR'),
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
                    _navigateToSoupDetail(context, yemekler[index]);
                    print('Tıklandı: ${yemekler[index].name}');
                  },
                  leading: Image.asset(
                    yemekler[index].imagePath,
                    width: 100, // Resim boyutunu ayarlamak için width belirleme
                    height:
                        100, // Resim boyutunu ayarlamak için height belirleme
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

  void _navigateToSoupDetail(BuildContext context, Yemek selectedSoup) {
    int index = yemekler.indexWhere((yemek) => yemek.name == selectedSoup.name);
    if (index >= 0 && index < tarifler.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SoupDetailPage(yemek: selectedSoup, tarif: tarifler[index]),
        ),
      );
    } else {
      // Handle the case when the corresponding tarif is not found.
      // You can show an error message or do whatever is appropriate for your use case.
    }
  }
}
