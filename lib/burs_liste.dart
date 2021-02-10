import 'package:burc_rehberi_flutter/utils/burcBilgileri.dart';
import 'package:flutter/material.dart';
import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> burcListesi;

  @override
  Widget build(BuildContext context) {
    burcListesi = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  //verileri listeye atamayı sağlar
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = BurcBilgileri.BURC_ADLARI[i].toLowerCase() + (i + 1).toString() + ".png";
      String buyukResim = BurcBilgileri.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}" + ".png";
      Burc burc =
          Burc(BurcBilgileri.BURC_ADLARI[i], BurcBilgileri.BURC_TARIHLERI[i], BurcBilgileri.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
      burclar.add(burc);
    }

    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemCount: burcListesi.length,
      itemBuilder: (context, index) {
        return tekSatirBurcWidgetHazirla(context, index);
      },
    );
  }

  Widget tekSatirBurcWidgetHazirla(BuildContext context, int index) {
    Burc oAnListeyeEklenenBurc = burcListesi[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/burcDetay/$index");
          },
          leading: Image.asset("images/" + oAnListeyeEklenenBurc.burcKucukResim, width: 64, height: 64),
          title: Text(
            oAnListeyeEklenenBurc.burcAdi,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.pink.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              oAnListeyeEklenenBurc.burcTarihi,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black38),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink),
        ),
      ),
    );
  }
}
