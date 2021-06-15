import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => new _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerNIM = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerJenisKelamin = TextEditingController();
  TextEditingController controllerJurusan = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();

  void tambah() {
    var url = "http://192.168.0.102/api_mahasiswa/insert.php";

    http.post(Uri.parse(url), body: {
      "nim": controllerNIM.text,
      "nama": controllerNama.text,
      "jenis_kelamin": controllerJenisKelamin.text,
      "jurusan": controllerJurusan.text,
      "alamat": controllerAlamat.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text("Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNIM,
                  decoration:
                      new InputDecoration(hintText: "NIM", labelText: "NIM"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration:
                      new InputDecoration(hintText: "Nama", labelText: "Nama"),
                ),
                new TextField(
                  controller: controllerJenisKelamin,
                  decoration: new InputDecoration(
                      hintText: "Jenis kelamin", labelText: "Jenis kelamin"),
                ),
                new TextField(
                  controller: controllerJurusan,
                  decoration: new InputDecoration(
                      hintText: "Jurusan", labelText: "Jurusan"),
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "Alamat", labelText: "Alamat"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Tambah Data"),
                  color: Colors.green,
                  onPressed: () {
                    tambah();
                    Navigator.pushReplacementNamed(context, '/Home');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
